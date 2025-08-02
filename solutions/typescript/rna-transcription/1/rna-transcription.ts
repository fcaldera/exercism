export function toRna(strand: string): string {
  return strand
    .split("")
    .map((n) => {
      if (!dict[n]) throw new Error("Invalid input DNA.");
      return dict[n];
    })
    .join("");
}

const dict: Record<string, string> = {
  G: "C",
  C: "G",
  T: "A",
  A: "U",
};
