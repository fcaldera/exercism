const ALLERGENS = [
  "eggs",
  "peanuts",
  "shellfish",
  "strawberries",
  "tomatoes",
  "chocolate",
  "pollen",
  "cats",
] as const;

type Allergen = (typeof ALLERGENS)[number];

export class Allergies {
  allergenIndex: number;

  constructor(allergenIndex: number) {
    this.allergenIndex = allergenIndex;
  }

  public list(): Allergen[] {
    return ALLERGENS.filter(this.allergicTo.bind(this));
  }

  public allergicTo(allergen: Allergen): boolean {
    let index = ALLERGENS.indexOf(allergen);
    if (index === -1) return false;
    return ((1 << index) & this.allergenIndex) != 0;
  }
}
