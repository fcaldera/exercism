export class Squares {
  sumOfSquares: number;
  squareOfSum: number;

  constructor(count: number) {
    this.squareOfSum = ((count * (count + 1)) / 2) ** 2;
    this.sumOfSquares = (count * (count + 1) * (2 * count + 1)) / 6;
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares;
  }
}
