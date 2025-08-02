export function convert(input: number): string {
  const sounds: string[] = [];

  if (input % 3 == 0) sounds.push("Pling");
  if (input % 5 == 0) sounds.push("Plang");
  if (input % 7 == 0) sounds.push("Plong");

  if (sounds.length == 0) return input.toString();

  return sounds.join("");
}
