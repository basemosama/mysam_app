part of '../imports/my_contributions_imports.dart';

class MyContributionsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    if (!Get.isRegistered<MyContributionsController>()) {
      Get.put(MyContributionsController());
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<MyContributionsController>()) {
      Get.delete<MyContributionsController>();
    }
  }
}
