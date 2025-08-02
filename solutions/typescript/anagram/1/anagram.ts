export class Anagram {
  private input: string;
  private sorted: string;

  constructor(input: string) {
    this.input = input.toLowerCase();
    this.sorted = [...this.input].sort().join("");
  }

  public matches(...potentials: string[]): string[] {
    return potentials.filter((word) => {
      const w = word.toLowerCase();

      if (w == this.input) return false;
      if (w.length != this.input.length) return false;

      return [...w].sort().join("") == this.sorted;
    });
  }
}
