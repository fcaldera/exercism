export function encode(input: number[]): number[] {
  return input.flatMap(encodeInt);
}

function encodeInt(input: number) {
  const str = input.toString(2);
  const padlen = Math.ceil(str.length / 7) * 7;
  const chunks = str.padStart(padlen, "0").match(/.{1,7}/g);

  return (
    chunks?.reduce<number[]>((arr, chunk, index) => {
      const cont = index == chunks.length - 1 ? 0 : 1;
      return [...arr, parseInt(chunk, 2) + 128 * cont];
    }, []) || []
  );
}

export function decode(input: number[]) {
  const output: number[] = [];

  let arr: string[] = [];

  for (const num of input) {
    const chunk = num.toString(2).padStart(8, "0");
    arr.push(chunk.slice(1));

    if (chunk.startsWith("0")) {
      output.push(parseInt(arr.join(""), 2));
      arr = [];
    }
  }

  if (arr.length > 0) throw new Error("Incomplete sequence");

  return output;
}
