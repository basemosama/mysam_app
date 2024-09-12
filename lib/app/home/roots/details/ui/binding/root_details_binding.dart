part of '../imports/root_details_imports.dart';

class RootDetailsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    if (!Get.isRegistered<RootDetailsController>()) {
      Get.put(RootDetailsController());
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<RootDetailsController>()) {
      Get.delete<RootDetailsController>();
    }
  }
}
