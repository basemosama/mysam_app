part of '../imports/create_contribution_imports.dart';

class CreateContributionBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    final args = state.extra as List?;
    Root? root;
    ContributionType? contributionType;
    if (args != null && args.length == 2) {
      root = args.first as Root?;
      contributionType = args.last as ContributionType?;
    }
    if (root == null || contributionType == null) {
      PlayxNavigation.pop();
      Alert.error(message: 'Invalid root or contribution type');
      return;
    }

    if (!Get.isRegistered<CreateContributionController>()) {
      Get.put(CreateContributionController(
          root: root, contributionType: contributionType));
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<CreateContributionController>()) {
      Get.delete<CreateContributionController>();
    }
  }
}
