export function squareRoot(radicand: number): number {
  let l = 0;
  while ((l++) ** 2 < radicand);
  return l - 1;
}
