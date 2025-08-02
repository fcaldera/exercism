export class Clock {
  time: number;

  constructor(hour: number, minute?: number) {
    this.time = hour * 60 + (minute || 0);
  }

  public toString(): string {
    const hour = ((Math.floor(this.time / 60) % 24) + 24) % 24;
    const minute = ((this.time % 60) + 60) % 60;

    return `${Clock.pad(hour)}:${Clock.pad(minute)}`;
  }

  public plus(minutes: number): Clock {
    this.time += minutes;
    return this;
  }

  public minus(minutes: number): Clock {
    this.time -= minutes;
    return this;
  }

  public equals(other: Clock): boolean {
    return this.toString() === other.toString();
  }

  private static pad(n: number): string {
    return n.toString().padStart(2, "0");
  }
}
