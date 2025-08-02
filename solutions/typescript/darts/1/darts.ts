interface Point {
  x: number;
  y: number;
}

export function score(x: number, y: number): number {
  const h = Math.sqrt(x ** 2 + y ** 2);
  if (h > 10) return 0;
  if (h <= 1) return 10;
  if (h <= 5) return 5;

  return 1;
}
