export function steps(count: number): number {
  if (count == 1) return 0;
  if (count <= 0 || !Number.isInteger(count)) {
    throw new Error("Only positive integers are allowed");
  }

  const next = count % 2 == 0 ? count / 2 : count * 3 + 1;
  return 1 + steps(next);
}
