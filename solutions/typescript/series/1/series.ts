export class Series {
  constructor(private series: string) {}

  slices(sliceLength: number): number[][] {
    const seriesLength = this.series.length;

    if (seriesLength == 0) throw new Error("series cannot be empty");
    if (sliceLength == 0) throw new Error("slice length cannot be zero");
    if (sliceLength < 0) throw new Error("slice length cannot be negative");

    if (sliceLength > seriesLength) {
      throw new Error("slice length cannot be greater than series length");
    }

    const arr = [...this.series].map(Number);
    const res: number[][] = [];

    for (let i = 0; i <= arr.length - sliceLength; i++) {
      res.push(arr.slice(i, i + sliceLength));
    }

    return res;
  }
}
