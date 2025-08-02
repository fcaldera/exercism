export function isPangram(sentence: string) {
  const s = sentence.toLowerCase();
  const alphabet = "abcdefghijklmnopqrstuvwxyz".split("");

  return alphabet.every((l) => s.includes(l));
}
