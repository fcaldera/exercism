type Mark = "X" | "O";
type Tuple = [number, number];

//prettier-ignore
const NEIGHBOURS = [
  [-1, 0], [-1, 1], // top, top-right
  [0, -1], [0, 1],  // left, right
  [1, -1], [1, 0],  // bottom-left, bottom
];

export class Board {
  board: string[][];
  dimensions: Tuple;

  constructor(board: string[]) {
    this.board = board.map((row) => row.trim().split(" "));
    this.dimensions = [this.board.length, this.board[0].length];
  }

  public winner(): Mark | "" {
    if (this.isWinnerO()) return "O";
    if (this.isWinnerX()) return "X";
    return "";
  }

  private isWinnerO() {
    return this.board[0].some((_, index) => this.isConnected("O", [0, index]));
  }

  private isWinnerX() {
    return this.board.some((_, index) => this.isConnected("X", [index, 0]));
  }

  private isConnected(mark: Mark, pos: Tuple): boolean {
    const [x, y] = pos;
    const [m, n] = this.dimensions;

    if (x < 0 || y < 0) return false;
    if (x >= m || y >= n) return false;
    if (this.board[x][y] != mark) return false;

    this.board[x][y] = "V";

    if (mark == "O" && x == m - 1) return true;
    if (mark == "X" && y == n - 1) return true;

    return NEIGHBOURS.some(([dx, dy]) =>
      this.isConnected(mark, [x + dx, y + dy]),
    );
  }
}
