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
  const seqs: string[] = rna.match(/.{1,3}/g) || [];
  const proteins: string[] = [];

  for (const seq of seqs) {
    const p = PROTEINS[seq];

    if (!p) throw new Error("Invalid codon");
    if (p == "STOP") break;

    proteins.push(p);
  }

  return proteins;
}
