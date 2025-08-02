class Node<T> {
  data: T;
  next?: Node<T>;

  constructor(data: T, next?: Node<T>) {
    this.data = data;
    this.next = next;
  }
}

type Predicate<T> = (el: T) => boolean;

export class List<T> {
  head?: Node<T>;
  tail?: Node<T>;

  public static create<T>(...values: T[]): List<T> {
    const list = new List<T>();

    for (const value of values) {
      list._push(value);
    }

    return list;
  }

  private _push(el: T) {
    const node = new Node(el);
    if (!this.head) this.head = node;
    if (this.tail) this.tail.next = node;

    this.tail = node;
  }

  private _insert(el: T) {
    const node = new Node(el);
    if (!this.tail) this.tail = node;
    if (this.head) node.next = this.head;
    this.head = node;
  }

  append(list: List<T>) {
    if (!list.head) return this;

    if (!this.head) {
      this.head = list.head;
      this.tail = list.tail;
      return this;
    }

    if (this.tail) this.tail.next = list.head;
    this.tail = list.tail;

    return this;
  }

  concat(list: List<List<T>>) {
    if (!list.head) return this;
    list.forEach((el) => this.append(el));
    return this;
  }

  filter(fn: Predicate<T>): List<T> {
    const list = new List<T>();

    this.forEach((el) => {
      if (fn(el)) list._push(el);
    });

    return list;
  }

  length(): number {
    let c = 0;
    this.forEach(() => c++);
    return c;
  }

  map(fn: (el: T) => T): List<T> {
    const list = new List<T>();
    this.forEach((el) => list._push(fn(el)));
    return list;
  }

  foldl(fn: (acc: any, el: T) => any, initialValue: any) {
    let acc: any = initialValue;
    this.forEach((el) => (acc = fn(acc, el)));
    return acc;
  }

  foldr(fn: (acc: any, el: T) => any, initialValue: any) {
    const list = this.reverse();
    return list.foldl(fn, initialValue);
  }

  reverse(): List<T> {
    const list = new List<T>();
    this.forEach((el) => list._insert(el));
    return list;
  }

  forEach(fn: (el: T) => any) {
    let node = this.head;

    while (node) {
      fn(node.data);
      node = node.next;
    }
  }
}
