export function squareRoot(radicand: number): number {
  let low = 0;
  let high = radicand + 1;
  let mid = 0;

  while (low < high) {
    mid = (low + high) >>> 1;

    const sqr = mid ** 2;
    if (sqr == radicand) return mid;

    if (sqr < radicand) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }

  return low;
}
