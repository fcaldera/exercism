type Bucket = "one" | "two";

export class TwoBucket {
  private buckets: [number, number];
  private totalMoves: number | undefined;

  constructor(
    ca: number,
    cb: number,
    private goal: number,
    start: Bucket,
  ) {
    this.buckets = [0, 0];

    if (this.goal % gcd(ca, cb) !== 0) return;

    const initial = start == "one" ? [ca, 0] : [0, cb];
    const queue = [{ buckets: initial, moves: 1 }];
    const visited = new Set<string>(["0,0", initial.join(",")]);

    while (queue.length > 0) {
      let {
        buckets: [a, b],
        moves,
      } = queue.shift()!;

      if (a == this.goal || b == this.goal) {
        this.buckets = [a, b];
        this.totalMoves = moves;
        return;
      }

      const next: [number, number][] = [];

      next.push(
        [ca, b], // fill A
        [a, cb], // fill B
        [a, 0], // empty B
        [0, b], // empty A
        [Math.max(0, a - (cb - b)), Math.min(cb, a + b)], // A -> B
        [Math.min(ca, a + b), Math.max(0, b - (ca - a))], // B -> A
      );

      for (const state of next) {
        const [a, b] = state;
        if (start == "one" && a == 0 && b == cb) continue;
        if (start == "two" && b == 0 && a == ca) continue;

        const key = state.join(",");
        if (visited.has(key)) continue;
        visited.add(key);
        queue.push({ buckets: state, moves: moves + 1 });
      }
    }
  }

  moves() {
    if (this.totalMoves == undefined) throw new Error();
    return this.totalMoves;
  }

  get goalBucket(): Bucket | undefined {
    const [a, b] = this.buckets;
    if (a == this.goal) return "one";
    if (b == this.goal) return "two";
  }

  get otherBucket() {
    const [a, b] = this.buckets;
    if (a == this.goal) return b;
    if (b == this.goal) return a;
  }
}

function gcd(a: number, b: number): number {
  while (b !== 0) {
    [a, b] = [b, a % b];
  }

  return a;
}
