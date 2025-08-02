type Options = {
  minFactor?: number;
  maxFactor?: number;
  sum: number;
};

export function triplets({ sum, ...opts }: Options): Triplet[] {
  const N = sum;
  const { minFactor = 1, maxFactor = N } = opts;

  const result: Triplet[] = [];

  for (let a = minFactor; a < maxFactor - 1; a++) {
    const b = (a * N - N ** 2 / 2) / (a - N);
    const c = N - a - b;

    if (!Number.isInteger(b)) continue;
    if (!Number.isInteger(c)) continue;
    if (b > maxFactor || c > maxFactor) continue;

    if (a > b || b > c || a > c) continue;
    if (a ** 2 + b ** 2 != c ** 2) continue;

    result.push(new Triplet(a, b, c));
  }

  return result;
}

class Triplet {
  constructor(
    private a: number,
    private b: number,
    private c: number,
  ) {}

  toArray(): [number, number, number] {
    return [this.a, this.b, this.c];
  }
}
