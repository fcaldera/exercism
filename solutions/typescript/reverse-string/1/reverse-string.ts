export function reverse(str: string) {
  return str.split("").reduceRight((acc, char) => acc.concat(char), "");
}
