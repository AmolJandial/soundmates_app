enum Gender {
  male,
  female,
  transgender,
  other;

  bool get isMale => this == Gender.male;
  bool get isFemale => this == Gender.female;
  bool get isTransgender => this == Gender.transgender;
  bool get isOther => this == Gender.other;
}
