export function isIsogram(str: string): boolean {
  str = str.replace(/[-\s]/, "").toLowerCase();
  const chars = new Set([...str]);
  return [...chars].join("") === str;
}
