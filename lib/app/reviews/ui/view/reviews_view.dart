part of '../imports/reviews_imports.dart';

class ReviewsView extends GetView<ReviewsController> {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppTrans.reviews,
      child: Container(),
    );
  }
}
