export class Robot {
  private static registry: string[] = [];
  private static head = 0;

  private _name: string;

  static {
    for (let i = 65; i <= 90; i++) {
      for (let j = 65; j <= 90; j++) {
        const alpha = String.fromCharCode(i, j);
        for (let k = 0; k <= 999; k++) {
          const num = k.toString().padStart(3, "0");
          this.registry.push(alpha + num);
        }
      }
    }

    this.releaseNames();
  }

  constructor() {
    this._name = Robot.generateName();
  }

  public get name(): string {
    return this._name;
  }

  public resetName(): void {
    this._name = Robot.generateName();
  }

  public static releaseNames(): void {
    this.head = 0;
  }

  private static generateName(): string {
    const head = this.head;
    const r = this.registry;
    const len = r.length;

    if (head >= len) throw new Error("Robots limit exceeded");

    const next = head + Math.floor(Math.random() * (len - head));
    const name = r[next];

    r[next] = r[head];
    r[head] = name;

    this.head = head + 1;

    return name;
  }
}
