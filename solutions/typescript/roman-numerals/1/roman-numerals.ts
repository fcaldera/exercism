type Tuple = [string, number];

const romans: Tuple[] = [
  ["M", 1000],
  ["D", 500],
  ["C", 100],
  ["L", 50],
  ["X", 10],
  ["V", 5],
  ["I", 1],
];

export const toRoman = (n: number): string => {
  let value = n;
  let res: string[] = [];

  for (const [k, v] of romans) {
    const q = Math.floor(value / v);
    res.push(k.repeat(q));
    value = value % v;
    if (value == 0) break;
  }

  return res
    .join("")
    .replace(/I{4}/g, "IV")
    .replace(/VIV/g, "IX")
    .replace(/X{4}/g, "XL")
    .replace(/LXL/g, "XC")
    .replace(/C{4}/g, "CD")
    .replace(/DCD/g, "CM");
};
