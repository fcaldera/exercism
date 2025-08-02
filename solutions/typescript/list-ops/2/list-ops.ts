type Predicate<T> = (el: T) => boolean;

export class List<T> {
  private values: T[];

  private constructor(...values: T[]) {
    this.values = values;
  }

  public static create<U>(...values: U[]): List<U> {
    return new List(...values);
  }

  append(list: List<T>): List<T> {
    return new List(...this.values, ...list.values);
  }

  concat(lists: List<List<T>>) {
    const values = lists.foldl((acc, el) => acc.append(el), new List<T>());
    return this.append(values);
  }

  filter(fn: Predicate<T>): List<T> {
    const values = this.foldl<T[]>((acc, el) => {
      if (!fn(el)) return acc;
      return [...acc, el];
    }, []);
    return new List(...values);
  }

  length(): number {
    return this.foldl((count, _) => ++count, 0);
  }

  map<U>(fn: (el: T) => U): List<U> {
    const values = this.foldl<U[]>((acc, el) => [...acc, fn(el)], []);
    return new List(...values);
  }

  foldl<U>(fn: (acc: U, el: T) => U, initial: U): U {
    if (this.values.length == 0) return initial;

    const head = this.values[0];
    const tail = this.values.slice(1);

    const list = new List(...tail);
    return list.foldl(fn, fn(initial, head));
  }

  foldr<U>(fn: (acc: U, el: T) => U, initial: U): U {
    if (this.values.length == 0) return initial;

    const head = this.values.slice(0, -1);
    const tail = this.values[this.values.length - 1];

    const list = new List(...head);
    return list.foldr(fn, fn(initial, tail));
  }

  reverse(): List<T> {
    const values = this.foldl<T[]>((acc, el) => [el, ...acc], []);
    return new List(...values);
  }

  forEach(fn: (el: T) => any): void {
    this.foldl((_, el) => fn(el), null);
  }
}
