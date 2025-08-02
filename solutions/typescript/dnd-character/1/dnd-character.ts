export class DnDCharacter {
  hitpoints: number;
  constitution: number;
  strength: number;
  dexterity: number;
  intelligence: number;
  wisdom: number;
  charisma: number;

  constructor() {
    this.constitution = DnDCharacter.generateAbilityScore();
    this.hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution);
    this.strength = DnDCharacter.generateAbilityScore();
    this.dexterity = DnDCharacter.generateAbilityScore();
    this.intelligence = DnDCharacter.generateAbilityScore();
    this.wisdom = DnDCharacter.generateAbilityScore();
    this.charisma = DnDCharacter.generateAbilityScore();
  }

  public static generateAbilityScore(): number {
    const throws: number[] = [];

    for (let i = 1; i <= 4; i++) {
      const dice = Math.ceil(Math.random() * 6);
      throws.push(dice);
    }

    return throws
      .sort((a, b) => a - b)
      .slice(-3)
      .reduce((a, b) => a + b, 0);
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2);
  }
}
