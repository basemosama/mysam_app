part of '../imports/contributions_imports.dart';

class ContributionsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    if (!Get.isRegistered<ContributionsController>()) {
      Get.put(ContributionsController());
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    // if (Get.isRegistered<ContributionsController>()) {
    //   Get.delete<ContributionsController>();
    // }
  }
}
