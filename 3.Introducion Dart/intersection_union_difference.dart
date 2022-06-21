void main() {
  Set<String> galapagosAnimals = {
    "Giant Tortoise",
    "Penguin",
    "Iguana",
    "Finch"
  };
  Set<String> northPoleAnimals = {"Penguin", "Polar Bear", "Seal"};

  Set<String> animalsInBoth = galapagosAnimals.intersection(northPoleAnimals);
  Set<String> animalsUnion = galapagosAnimals.union(northPoleAnimals);
  Set<String> animalsDifference = galapagosAnimals.difference(northPoleAnimals);

  print(animalsInBoth);
  print(animalsUnion);
  print(animalsDifference);
}
