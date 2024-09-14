part of '../imports/profile_imports.dart';

class ProfileBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    // if (Get.isRegistered<ProfileController>()) {
    //   Get.delete<ProfileController>();
    // }
  }
}
