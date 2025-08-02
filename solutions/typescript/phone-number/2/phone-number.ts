export function clean(input: string) {
  switch (true) {
    case /[a-zA-Z]/.test(input): throw new Error("Letters not permitted");
    case /^\s\d\w-+()./.test(input): throw new Error("Punctuations not permitted");
  }

  input = input.trim();

  const regex =
    /^\+?(?<country>\d)?[ -.]*\(?(?<area>\d{3})\)?[ -.]*(?<exchange>\d{3})[ -.]*(?<subscriber>\d{4})$/g;

  const matches = [...input.matchAll(regex)][0];
  const { country, area, exchange } = matches?.groups || {};

  if (!matches) {
    const digcount = (input.match(/\d/g) || []).length;
    if (digcount > 11) throw new Error("More than 11 digits");
    throw new Error("Incorrect number of digits");
  }

  if (country && country != "1") {
    throw new Error("11 digits must start with 1");
  }

  if (area.startsWith("0")) {
    throw new Error("Area code cannot start with zero");
  }

  if (area.startsWith("1")) {
    throw new Error("Area code cannot start with one");
  }

  if (exchange.startsWith("0")) {
    throw new Error("Exchange code cannot start with zero");
  }

  if (exchange.startsWith("1")) {
    throw new Error("Exchange code cannot start with one");
  }

  return input.replace(/\D/g, "").replace(/^1/, "");
}
