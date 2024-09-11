class ProfileDatasource {
  static final ProfileDatasource _instance = ProfileDatasource._internal();

  factory ProfileDatasource() {
    return _instance;
  }

  ProfileDatasource._internal();
}
