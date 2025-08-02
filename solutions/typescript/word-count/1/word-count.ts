export function count(str: string) {
  const regex = /\w+(?:'\w+)?/g;
  const matches = str.toLowerCase().matchAll(regex);
  const map = new Map();

  for (const m of matches) {
    map.set(m[0], (map.get(m[0]) || 0) + 1);
  }

  return map;
}
