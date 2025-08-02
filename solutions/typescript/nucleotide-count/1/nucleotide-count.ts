type Nucleotide = "A" | "C" | "G" | "T";

export function nucleotideCounts(strand: string): Record<Nucleotide, number> {
  const result: Record<Nucleotide, number> = {
    A: 0,
    C: 0,
    G: 0,
    T: 0,
  };

  for (let i = 0; i < strand.length; i++) {
    const nucleotide = strand[i] as Nucleotide;

    if (!(nucleotide in result)) {
      throw new Error("Invalid nucleotide in strand");
    }

    result[nucleotide]++;
  }

  return result;
}
