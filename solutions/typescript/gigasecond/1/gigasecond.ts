export class Gigasecond {
  private time: number;

  constructor(date: Date) {
    this.time = date.getTime() + 10 ** (9 + 3);
  }

  public date() {
    return new Date(this.time);
  }
}
