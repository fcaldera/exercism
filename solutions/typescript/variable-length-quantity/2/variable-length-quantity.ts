export function encode(input: number[]): number[] {
  return input.flatMap(encodeInt);
}

function encodeInt(num: number) {
  const chunks: number[] = [];

  do {
    const byte = num & 0x7f;
    const cont = chunks.length ? 0x80 : 0x0;
    chunks.push(byte | cont);
    num >>>= 7;
  } while (num > 0);

  return chunks.reverse();
}

export function decode(input: number[]) {
  const output: number[] = [];

  let current = 0;
  let partial = false;

  for (let byte of input) {
    current |= byte & 0x7f;
    partial = (byte & 0x80) != 0;

    if (!partial) {
      output.push(current >>> 0); // Ensure unsigned 32-bit
      current = 0;
    }

    current <<= 7;
  }

  if (partial) throw new Error("Incomplete sequence");

  return output;
}
