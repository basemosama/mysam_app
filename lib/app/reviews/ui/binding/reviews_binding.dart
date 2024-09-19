part of '../imports/reviews_imports.dart';

class ReviewsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    final roleType = await MyPreferenceManger.instance.userRoleType;
    if (roleType != UserRoleType.moderator) {
      Alert.error(message: 'أنت لا تمتلك صلاحية الوصول لهذه الصفحة');
      PlayxNavigation.pop();
      return;
    }

    if (!Get.isRegistered<ReviewsController>()) {
      Get.put(ReviewsController());
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {}
}
