class ReviewsRepository {
  static final ReviewsRepository _instance = ReviewsRepository._internal();

  factory ReviewsRepository() {
    return _instance;
  }

  ReviewsRepository._internal();
}
