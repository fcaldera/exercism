export function compute(left: string, right: string): number {
  if (left == right) return 0;

  if (left.length !== right.length) {
    throw new Error("DNA strands must be of equal length.");
  }

  let distance = 0;

  for (let i = 0; i < left.length; i++) {
    if (left.charAt(i) !== right.charAt(i)) distance++;
  }

  return distance;
}
