type Color = (typeof COLORS)[number];

export function decodedValue(colors: Color[]): number {
  const [c1, c2] = colors;
  return COLORS.indexOf(c1) * 10 + COLORS.indexOf(c2);
}

export const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
] as const;
