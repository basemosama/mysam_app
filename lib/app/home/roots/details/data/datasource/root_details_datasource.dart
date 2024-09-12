class RootDetailsDatasource {
  static final RootDetailsDatasource _instance =
      RootDetailsDatasource._internal();

  factory RootDetailsDatasource() {
    return _instance;
  }

  RootDetailsDatasource._internal();
}
