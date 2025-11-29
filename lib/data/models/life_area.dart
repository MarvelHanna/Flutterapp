enum LifeArea { school, work, home, health, personal, social }

extension LifeAreaX on LifeArea {
  String get label {
    switch (this) {
      case LifeArea.school:
        return 'School';
      case LifeArea.work:
        return 'Work';
      case LifeArea.home:
        return 'Home';
      case LifeArea.health:
        return 'Health';
      case LifeArea.personal:
        return 'Personal';
      case LifeArea.social:
        return 'Social';
    }
  }
}
