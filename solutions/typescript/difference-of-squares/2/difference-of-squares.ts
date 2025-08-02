export class Squares {
  readonly sumOfSquares: number;
  readonly squareOfSum: number;
  readonly difference: number;

  constructor(n: number) {
    const sum = (n * (n + 1)) / 2;
    this.squareOfSum = sum ** 2;
    this.sumOfSquares = (n * (n + 1) * (2 * n + 1)) / 6;
    this.difference = this.squareOfSum - this.sumOfSquares;
  }
}
