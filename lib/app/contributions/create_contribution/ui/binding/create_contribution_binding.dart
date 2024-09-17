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
    if (root == null ||
        contributionType == null ||
        contributionType == ContributionType.unknown) {
      PlayxNavigation.pop();
      Alert.error(message: 'Invalid root or contribution type');
      return;
    }

    switch (contributionType) {
      case ContributionType.qa:
        final controller = CreateQaContributionController(root: root);
        Get.put<CreateQaContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case ContributionType.idiom:
        final controller = CreateIdiomContributionController(root: root);
        Get.put<CreateIdiomContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case ContributionType.modernMeaning:
        final controller =
            CreateModernMeaningContributionController(root: root);
        Get.put<CreateModernMeaningContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case ContributionType.photo:
        final controller = CreatePhotoContributionController(root: root);
        Get.put<CreatePhotoContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case ContributionType.poem:
        final controller = CreatePoemContributionController(root: root);
        Get.put<CreatePoemContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case ContributionType.slang:
        final controller = CreateSlangContributionController(root: root);
        Get.put<CreateSlangContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case ContributionType.synonyms:
        final controller = CreateSynonymsContributionController(root: root);
        Get.put<CreateSynonymsContributionController>(controller);
        Get.put<CreateContributionController>(controller);
      case _:
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<CreateContributionController>()) {
      Get.delete<CreateContributionController>();
    }
    if (Get.isRegistered<CreateQaContributionController>()) {
      Get.delete<CreateQaContributionController>();
    }
    if (Get.isRegistered<CreateIdiomContributionController>()) {
      Get.delete<CreateIdiomContributionController>();
    }
    if (Get.isRegistered<CreateModernMeaningContributionController>()) {
      Get.delete<CreateModernMeaningContributionController>();
    }
    if (Get.isRegistered<CreatePhotoContributionController>()) {
      Get.delete<CreatePhotoContributionController>();
    }
    if (Get.isRegistered<CreatePoemContributionController>()) {
      Get.delete<CreatePoemContributionController>();
    }
    if (Get.isRegistered<CreateSlangContributionController>()) {
      Get.delete<CreateSlangContributionController>();
    }
    if (Get.isRegistered<CreateSynonymsContributionController>()) {
      Get.delete<CreateSynonymsContributionController>();
    }
  }
}
