export function commands(input: number) {
  const actions: string[] = [];

  if (input & (1 << 0)) actions.push("wink");
  if (input & (1 << 1)) actions.push("double blink");
  if (input & (1 << 2)) actions.push("close your eyes");
  if (input & (1 << 3)) actions.push("jump");
  if (input & (1 << 4)) actions.reverse();

  return actions;
}
