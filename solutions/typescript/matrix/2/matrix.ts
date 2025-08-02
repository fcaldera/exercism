export class Matrix {
  matrix: string;

  constructor(matrix: string) {
    this.matrix = matrix;
  }

  get rows(): number[][] {
    return this.matrix.split("\n").map((r) => r.split(" ").map(parseInt));
  }

  get columns(): number[][] {
    const matrix = this.rows;
    return matrix[0].map((_, idx) => matrix.map((row) => row[idx]));
  }
}
