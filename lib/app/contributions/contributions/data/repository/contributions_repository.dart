class ContributionsRepository {
  static final ContributionsRepository _instance =
      ContributionsRepository._internal();

  factory ContributionsRepository() {
    return _instance;
  }

  ContributionsRepository._internal();
}
