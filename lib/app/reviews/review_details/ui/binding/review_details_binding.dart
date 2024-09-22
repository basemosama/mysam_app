part of '../imports/review_details_imports.dart';

class ReviewDetailsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    final contribution = state.extra as Contribution?;

    if (contribution == null) {
      Alert.error(
        message: 'Contribution not found',
      );
      PlayxNavigation.pop();
      return;
    }

    if (!Get.isRegistered<ReviewDetailsController>()) {
      Get.put(ReviewDetailsController(contribution: contribution));
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<ReviewDetailsController>()) {
      Get.delete<ReviewDetailsController>();
    }
  }
}
