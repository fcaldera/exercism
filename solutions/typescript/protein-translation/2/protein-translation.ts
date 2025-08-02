const PROTEINS: Record<string, string> = {
  AUG: "Methionine",
  UUU: "Phenylalanine",
  UUC: "Phenylalanine",
  UUA: "Leucine",
  UUG: "Leucine",
  UCU: "Serine",
  UCC: "Serine",
  UCA: "Serine",
  UCG: "Serine",
  UAU: "Tyrosine",
  UAC: "Tyrosine",
  UGU: "Cysteine",
  UGC: "Cysteine",
  UGG: "Tryptophan",
  UAA: "STOP",
  UAG: "STOP",
  UGA: "STOP",
};

export function translate(rna: string): string[] {
  const result: string[] = [];

  for (const codon of rna.match(/.{1,3}/g) || []) {
    const protein = PROTEINS[codon];

    if (!protein) throw new Error("Invalid codon");
    if (protein == "STOP") break;

    result.push(protein);
  }

  return result;
}
