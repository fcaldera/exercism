export function transform(data: { [key: string]: string[] }): {
  [key: string]: number;
} {
  const map: Map<string, number> = new Map();

  for (const [k, v] of Object.entries(data)) {
    v.forEach((el) => map.set(el.toLowerCase(), parseInt(k)));
  }

  return Object.fromEntries(map);
}
