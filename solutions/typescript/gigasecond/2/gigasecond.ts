export class Gigasecond {
  private time: number;

  constructor(date: Date) {
    this.time = date.getTime() + 1e12;
  }

  public date() {
    return new Date(this.time);
  }
}
