type Planet =
  | "mercury"
  | "venus"
  | "earth"
  | "mars"
  | "jupiter"
  | "saturn"
  | "uranus"
  | "neptune";

type Orbitals = Record<Planet, number>;

export function age(planet: Planet, seconds: number): number {
  const map: Orbitals = {
    mercury: 0.240846,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
  };

  const years = seconds / (60 * 60 * 24 * 365.25);

  return Math.round((years / map[planet]) * 100) / 100;
}
