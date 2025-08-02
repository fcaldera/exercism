export function encode(plainText: string): string {
  plainText = plainText.toLowerCase().replace(/[^a-z0-9]/g, "");

  return plainText
    .split("")
    .map((c, index) => {
      let code = c.charCodeAt(0);
      if (code >= 97 && code <= 122) code = 122 + 97 - code;
      let char = String.fromCharCode(code);
      if ((index + 1) % 5 == 0) char += " ";
      return char;
    })
    .join("")
    .trim();
}

export function decode(cipherText: string): string {
  return encode(cipherText).replace(/[^a-z0-9]/g, "");
}
