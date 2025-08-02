export class SimpleCipher {
  key: string;

  constructor(key?: string) {
    if (!key?.length) {
      key = this.generateRandomKey();
    }

    this.key = key;
  }

  encode(s: string): string {
    return s
      .split("")
      .map((c, i) => {
        const shift = this.key.charCodeAt(i % this.key.length);
        const code = (c.charCodeAt(0) + shift - 97 * 2) % 26;
        return String.fromCharCode(code + 97);
      })
      .join("");
  }

  decode(s: string): string {
    return s
      .split("")
      .map((c, i) => {
        const shift = this.key.charCodeAt(i % this.key.length);
        const code = (26 + c.charCodeAt(0) - shift) % 26;
        return String.fromCharCode(code + 97);
      })
      .join("");
  }

  private generateRandomKey(): string {
    const key: string[] = [];
    for (let i = 0; i < 100; i++) {
      const char = String.fromCharCode(97 + Math.floor(Math.random() * 26));
      key.push(char);
    }

    return key.join("");
  }
}
