part of '../imports/splash_imports.dart';

class SplashBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    if (!Get.isRegistered<SplashController>()) {
      Get.put(SplashController());
    }
  }

  @override
  Future<void> onExit(
    BuildContext context,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<SplashController>()) {
      Get.delete<SplashController>();
    }
  }
}
