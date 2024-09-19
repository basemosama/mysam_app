class ReviewsDatasource {
  static final ReviewsDatasource _instance = ReviewsDatasource._internal();

  factory ReviewsDatasource() {
    return _instance;
  }

  ReviewsDatasource._internal();
}
