type Nicomachus = "perfect" | "abundant" | "deficient";

export function classify(n: number): Nicomachus {
  if (n <= 0) {
    throw new Error("Classification is only possible for natural numbers.");
  }

  const sum = aliquotSum(n);

  if (n == sum) return "perfect";
  return n < sum ? "abundant" : "deficient";
}

function aliquotSum(n: number): number {
  if (n == 1) return 0;

  let sum = 1;
  const sqrt = Math.sqrt(n);

  for (let i = 2; i <= sqrt; i++) {
    if (n % i == 0) {
      sum += i;
      const quotient = n / i;
      if (quotient != i) sum += quotient;
    }
  }

  return sum;
}
