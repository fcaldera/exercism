export class Triangle {
  sides: number[];

  constructor(...sides: number[]) {
    this.sides = sides;
  }

  get isEquilateral(): boolean {
    const [a, b, c] = this.sides;
    return this.isTriangle() && a == b && b == c;
  }

  get isIsosceles(): boolean {
    const [a, b, c] = this.sides;
    return this.isTriangle() && (a == b || b == c || a == c);
  }

  get isScalene(): boolean {
    const [a, b, c] = this.sides;
    return this.isTriangle() && a !== b && b !== c && a !== c;
  }

  private isTriangle(): boolean {
    const [a, b, c] = this.sides;
    if (a <= 0 || b <= 0 || c <= 0) return false;
    return a + b >= c && b + c >= a && a + c >= b;
  }
}
