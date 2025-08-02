export const square = (n: number): bigint => {
  if (n > 64) throw new Error("Invalid square");
  return BigInt(2 ** (n - 1));
};

export const total = (): bigint => {
  return BigInt(2 ** 64) - 1n;
};
