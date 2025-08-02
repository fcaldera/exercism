export function find(haystack: number[], needle: number): number | never {
  let lo = 0;
  let hi = haystack.length;

  while (lo < hi) {
    const mid = Math.floor((lo + hi) / 2);

    if (haystack[mid] < needle) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }

  if (lo == hi && haystack[lo] !== needle) {
    throw new Error("Value not in array");
  }

  return lo;
}
