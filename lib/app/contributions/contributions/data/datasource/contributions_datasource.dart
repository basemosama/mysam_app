class ContributionsDatasource {
  static final ContributionsDatasource _instance =
      ContributionsDatasource._internal();

  factory ContributionsDatasource() {
    return _instance;
  }

  ContributionsDatasource._internal();
}
