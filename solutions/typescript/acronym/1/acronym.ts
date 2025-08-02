export function parse(phrase: string): string | undefined {
  const matches = phrase.match(/(?<=^|[ -])(\w)|(?<=[a-z])([A-Z])/g);
  return matches?.join("")?.toUpperCase();
}
