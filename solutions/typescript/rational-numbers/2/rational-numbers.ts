export class Rational {
  private a: number;
  private b: number;

  constructor(a: number, b: number) {
    this.a = a;
    this.b = b;
  }

  get numerator() {
    return this.a;
  }
  get denominator() {
    return this.b;
  }

  add(r2: Rational): Rational {
    const { a: a1, b: b1 } = this;
    const { a: a2, b: b2 } = r2;
    return new Rational(a1 * b2 + b1 * a2, b1 * b2).reduce();
  }

  sub(r2: Rational): Rational {
    const { a, b } = r2;
    return this.add(new Rational(a * -1, b));
  }

  mul(r2: Rational): Rational {
    const { a: a1, b: b1 } = this;
    const { a: a2, b: b2 } = r2;
    return new Rational(a1 * a2, b1 * b2).reduce();
  }

  div(r2: Rational): Rational {
    const { a: a1, b: b1 } = this;
    const { a: a2, b: b2 } = r2;
    return new Rational(a1 * b2, b1 * a2).reduce();
  }

  abs(): Rational {
    const { a, b } = this;
    return new Rational(Math.abs(a), Math.abs(b)).reduce();
  }

  exprational(n: number): Rational {
    let { a, b } = this;

    if (n < 0) {
      const temp = a;
      a = b;
      b = temp;
      n *= -1;
    }

    return new Rational(a ** n, b ** n).reduce();
  }

  expreal(x: number): number {
    const { a, b } = this;
    return (x ** a) ** (1 / b);
  }

  reduce(): Rational {
    const { a, b } = this;
    const gcd = this.gcd(a, b);

    let ra = a / gcd;
    let rb = b / gcd;

    if (rb < 0) {
      ra *= -1;
      rb *= -1;
    }

    return new Rational(ra, rb);
  }

  private gcd(a: number, b: number): number {
    a = Math.abs(a);
    b = Math.abs(b);

    while (b > 0) {
      [a, b] = [b, a % b];
    }

    return a;
  }
}
