part of '../imports/roots_imports.dart';

class RootsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    if (!Get.isRegistered<RootsController>()) {
      Get.put(RootsController());
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    // if (Get.isRegistered<RootsController>()) {
    //   Get.delete<RootsController>();
    // }
  }
}
