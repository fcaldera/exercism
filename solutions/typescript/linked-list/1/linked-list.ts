interface Node<T> {
  value: T;
  next?: Node<T>;
  prev?: Node<T>;
}

export class LinkedList<T> {
  head: Node<T> | undefined;
  tail: Node<T> | undefined;
  size: number;

  constructor() {
    this.head = undefined;
    this.tail = undefined;
    this.size = 0;
  }

  public push(element: T) {
    const node: Node<T> = { value: element, prev: this.tail };

    if (this.tail) this.tail.next = node;
    if (!this.head) this.head = node;

    this.tail = node;
    this.size++;
  }

  public pop(): T | undefined {
    const node = this.tail;
    this.tail = node?.prev;

    this.size--;

    return node?.value;
  }

  public shift(): T | undefined {
    const node = this.head;
    this.head = this.head?.next;
    this.size--;

    return node?.value;
  }

  public unshift(element: T) {
    const node: Node<T> = { value: element, next: this.head };

    if (this.head) this.head.prev = node;
    if (!this.tail) this.tail = node;

    this.head = node;
    this.size++;
  }

  public delete(element: T) {
    let node = this.head;

    while (node) {
      if (node.value === element) {
        const prev = node.prev;
        const next = node.next;

        if (!prev) {
          this.head = node.next;
        } else {
          prev.next = next;
        }

        if (!next) {
          this.tail = node.prev;
        } else {
          next.prev = prev;
        }

        this.size--;

        return;
      }

      node = node.next;
    }
  }

  public count(): number {
    return this.size;
  }
}
