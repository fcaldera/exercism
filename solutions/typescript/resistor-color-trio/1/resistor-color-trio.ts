type Color = (typeof COLORS)[number];

function format(value: number, unit: string): string {
  return `${value} ${unit}`;
}

export function decodedResistorValue(colors: Color[]) {
  const [c1, c2, c3] = colors;
  const zeros = COLORS.indexOf(c3);

  let value =
    COLORS.indexOf(c1) * 10 ** (zeros + 1) +
    COLORS.indexOf(c2) * (zeros > 0 ? 10 ** zeros : 1);

  if (value < 1_000) return format(value, "ohms");

  if (value >= 1_000 && value < 10 ** 6) {
    return format(value / 1_000, "kiloohms");
  }

  if (value >= 10 ** 6 && value < 10 ** 9) {
    return format(value / 10 ** 6, "megaohms");
  }

  return format(value / 10 ** 9, "gigaohms");
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
