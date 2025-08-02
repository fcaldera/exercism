export function count(str: string): Map<string, number> {
  const regex = /\w+(?:'\w+)?/g;
  const matches = str.toLowerCase().matchAll(regex);
  const map = new Map<string, number>();

  for (const m of matches) {
    map.set(m[0], (map.get(m[0]) || 0) + 1);
  }

  return map;
}
