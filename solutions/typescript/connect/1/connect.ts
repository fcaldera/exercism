type Mark = "X" | "O";

interface Cell {
  x: number;
  y: number;
}

export class Board {
  board: string[][];

  constructor(board: string[]) {
    this.board = board.map((row) => row.replace(/\s/g, "").split(""));
  }

  public winner(): Mark | "" {
    if (isWinner(this.board, "O")) return "O";
    if (isWinner(rotate(this.board), "X")) return "X";
    return "";
  }
}

function isWinner(board: string[][], mark: Mark, start?: Cell) {
  if (!start) {
    start = { x: 0, y: board[0].indexOf(mark) };
    return isWinner(board, mark, start);
  }

  const { x, y } = start;

  if (x < 0 || y < 0 || x >= board.length || y >= board[x].length) {
    return false;
  }

  if (board[x][y] == mark) {
    board[x][y] = "V"; // Mark as visited

    if (x == board.length - 1) return true;

    // prettier-ignore
    const adjacents = [
      [-1, 0], [-1, 1], // top-left, top-right
      [0, -1], [0, 1],  // left, right
      [1, -1], [1, 1],  // bottom-left, bottom-right
    ];

    if (mark == "X") {
      // Rotation adjustments
      adjacents[1] = [-1, -1];
      adjacents[4] = [1, 0];
    }

    for (const [dx, dy] of adjacents) {
      if (isWinner(board, mark, { x: x + dx, y: y + dy })) return true;
    }

    board[x][y] = mark; // Restore
  }

  return false;
}

function rotate(board: string[][]): string[][] {
  const n = board.length;
  const m = board[0].length;
  const rotated = Array.from({ length: m }, () => Array(n));

  for (let i = 0; i < n; i++) {
    for (let j = 0; j < m; j++) {
      rotated[j][n - 1 - i] = board[i][j];
    }
  }

  return rotated;
}
