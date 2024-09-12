class RootDetailsRepository {
  static final RootDetailsRepository _instance =
      RootDetailsRepository._internal();

  factory RootDetailsRepository() {
    return _instance;
  }

  RootDetailsRepository._internal();
}
