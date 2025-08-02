export class Triangle {
  isEquilateral: boolean;
  isIsosceles: boolean;
  isScalene: boolean;

  constructor(...sides: number[]) {
    const [a, b, c] = sides;
    const inequality = c >= a + b;

    this.isEquilateral = inequality && a == b && b == c;
    this.isScalene = a !== b && b !== c && a !== c;
    this.isIsosceles = a == b || b == c || a == c;
  }
}
