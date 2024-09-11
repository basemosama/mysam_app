class HomeRepository {
  static final HomeRepository _instance = HomeRepository._internal();

  factory HomeRepository() {
    return _instance;
  }

  HomeRepository._internal();
}
