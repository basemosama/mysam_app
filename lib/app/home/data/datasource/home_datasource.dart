class HomeDatasource {
  static final HomeDatasource _instance = HomeDatasource._internal();

  factory HomeDatasource() {
    return _instance;
  }

  HomeDatasource._internal();
}
