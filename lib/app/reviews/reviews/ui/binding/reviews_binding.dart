part of '../imports/reviews_imports.dart';

class ReviewsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    Get.put(ReviewsController());
    final roleType = await MyPreferenceManger.instance.userRoleType;
    if (roleType != UserRoleType.moderator) {
      Alert.error(message: 'أنت لا تمتلك صلاحية الوصول لهذه الصفحة');
      PlayxNavigation.pop();
      return;
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {}
}
