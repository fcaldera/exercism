export function hey(message: string): string {
  const isQuestion = message.trim().endsWith("?");
  const isSilence = message.trim().length == 0;
  const isYelling = /[A-Z]+/.test(message) && /^[^a-z]*$/.test(message);

  if (isSilence) return "Fine. Be that way!";
  if (isQuestion && isYelling) return "Calm down, I know what I'm doing!";
  if (isQuestion) return "Sure.";
  if (isYelling) return "Whoa, chill out!";

  return "Whatever.";
}
