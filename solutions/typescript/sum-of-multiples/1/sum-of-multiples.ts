export function sum(items: number[], level: number) {
  const values = new Set<number>();

  for (const item of items) {
    if (item == 0) continue;
    let value = item;
    while (value < level) {
      values.add(value);
      value += item;
    }
  }

  return Array.from(values).reduce((acc, cur) => acc + cur, 0);
}
