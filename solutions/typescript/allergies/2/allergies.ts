const ALLERGENS = {
  eggs: 1,
  peanuts: 2,
  shellfish: 4,
  strawberries: 8,
  tomatoes: 16,
  chocolate: 32,
  pollen: 64,
  cats: 128,
} as const;

type Allergen = keyof typeof ALLERGENS;

export class Allergies {
  allergenIndex: number;

  constructor(allergenIndex: number) {
    this.allergenIndex = allergenIndex;
  }

  public list(): Allergen[] {
    const allergens = Object.keys(ALLERGENS) as Allergen[];
    return allergens.filter(this.allergicTo.bind(this));
  }

  public allergicTo(allergen: Allergen): boolean {
    return (ALLERGENS[allergen] & this.allergenIndex) != 0;
  }
}
