export function valid(digitString: string): boolean {
  let str = digitString.replace(/\s+/g, "");
  if (str.length < 2) return false;

  const len = str.length;
  const sum = Array.from(str, Number).reduceRight((acc, n, i) => {
    const j = len - i - 1;

    if (j % 2 != 0) {
      n *= 2;
      if (n > 9) n -= 9;
    }

    return acc + n;
  }, 0);

  return sum % 10 == 0;
}
