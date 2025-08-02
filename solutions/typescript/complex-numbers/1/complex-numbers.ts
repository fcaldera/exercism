export class ComplexNumber {
  private _real: number;
  private _imag: number;

  constructor(real: number, imaginary: number) {
    this._real = real;
    this._imag = imaginary;
  }

  public get real(): number {
    return this._real;
  }

  public get imag(): number {
    return this._imag;
  }

  public add(other: ComplexNumber): ComplexNumber {
    this._real += other.real;
    this._imag += other.imag;
    return this;
  }

  public sub(other: ComplexNumber): ComplexNumber {
    this._real -= other.real;
    this._imag -= other.imag;
    return this;
  }

  public div(other: ComplexNumber): ComplexNumber {
    const divisor = other.imag ** 2 + other.real ** 2;
    const real = (this._real * other.real + this._imag * other.imag) / divisor;
    const imag = (this._imag * other.real - this._real * other.imag) / divisor;

    this._real = real;
    this._imag = imag;

    return this;
  }

  public mul(other: ComplexNumber): ComplexNumber {
    const real = this._real * other.real - this._imag * other.imag;
    const imag = this.real * other.imag + this._imag * other.real;

    this._real = real;
    this._imag = imag;

    return this;
  }

  public get abs(): Number {
    return Math.sqrt(this._real ** 2 + this._imag ** 2);
  }

  public get conj(): ComplexNumber {
    this._imag = this._imag == 0 ? 0 : this._imag * -1;
    return this;
  }

  public get exp(): ComplexNumber {
    const ea = Math.E ** this._real;

    this._real = ea * Math.cos(this._imag);
    this._imag = ea * Math.sin(this._imag);

    return this;
  }
}
