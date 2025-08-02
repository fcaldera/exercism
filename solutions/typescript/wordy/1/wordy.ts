export const answer = (question: string): number => {
  let q: string = question.replace("What is", "");

  q = q.replace(/plus/g, "+");
  q = q.replace(/minus/g, "-");
  q = q.replace(/multiplied by/g, "*");
  q = q.replace(/divided by/g, "/");
  q = q.replace("?", "").trim();

  if (q.length == 0) throw new Error("Syntax error");

  try {
    Number(eval(q));
  } catch (e) {
    if (!/[+*\-\/]/.test(q)) throw new Error("Unknown operation");
    throw new Error("Syntax error");
  }

  // Evaluate left to right
  const result = q.split(" ").reduce((a: string[], e: string) => {
    const exp = [...a, e];

    if (exp.length === 3) {
      try {
        return [eval(exp.join(" "))];
      } catch (e) {
        throw new Error("Syntax error");
      }
    }

    return exp;
  }, []);

  return Number(result[0]);
};
