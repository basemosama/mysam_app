part of '../imports/root_details_imports.dart';

class RootDetailsBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    final root = state.extra as Root?;
    if (root == null) {
      Alert.error(message: 'Root not found');
      PlayxNavigation.pop();
      return;
    }

    if (!Get.isRegistered<RootDetailsController>()) {
      Get.put(RootDetailsController(root: root));
    } else {
      Get.find<RootDetailsController>().root = root;
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
