export class Triangle {
  isEquilateral: boolean;
  isIsosceles: boolean;
  isScalene: boolean;

  constructor(...sides: number[]) {
    const [a, b, c] = sides;
    const inequality = c < a + b && a < b + c && b < a + c;

    this.isEquilateral = inequality && a == b && b == c;
    this.isIsosceles = inequality && (a == b || b == c || a == c);
    this.isScalene = inequality && a !== b && b !== c && a !== c;
  }
}
