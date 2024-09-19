part of '../imports/edit_contribution_imports.dart';

class EditContributionBinding extends PlayxBinding {
  @override
  Future<void> onEnter(BuildContext context, GoRouterState state) async {
    final args = state.extra as List?;
    Contribution? contribution;
    Root? root;
    Fimber.d('EditContributionBinding: args: $args');
    if (args != null && args.length == 2) {
      contribution = args.first as Contribution?;
      root = args.last as Root?;
    }
    if (contribution == null || root == null) {
      PlayxNavigation.pop();
      Alert.error(message: 'Invalid contribution');
      return;
    }
    Fimber.d('EditContributionBinding:2 args: ${contribution.type}');

    switch (contribution.type) {
      case ContributionType.qa:
        final controller = EditQaContributionController(
          contribution: contribution,
          root: root,
        );
        Get.put<EditQaContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case ContributionType.idiom:
        final controller = EditIdiomContributionController(
            contribution: contribution, root: root,);
        Get.put<EditIdiomContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case ContributionType.modernMeaning:
        final controller = EditModernMeaningContributionController(
            contribution: contribution, root: root,);
        Get.put<EditModernMeaningContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case ContributionType.photo:
        final controller = EditPhotoContributionController(
            contribution: contribution, root: root,);
        Get.put<EditPhotoContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case ContributionType.poem:
        final controller = EditPoemContributionController(
            contribution: contribution, root: root,);
        Get.put<EditPoemContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case ContributionType.slang:
        final controller = EditSlangContributionController(
            contribution: contribution, root: root,);
        Get.put<EditSlangContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case ContributionType.synonyms:
        final controller = EditSynonymsContributionController(
            contribution: contribution, root: root,);
        Get.put<EditSynonymsContributionController>(controller);
        Get.put<EditContributionController>(controller);
      case _:
    }
  }

  @override
  Future<void> onExit(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (Get.isRegistered<EditContributionController>()) {
      Get.delete<EditContributionController>();
    }
    if (Get.isRegistered<EditQaContributionController>()) {
      Get.delete<EditQaContributionController>();
    }
    if (Get.isRegistered<EditIdiomContributionController>()) {
      Get.delete<EditIdiomContributionController>();
    }
    if (Get.isRegistered<EditModernMeaningContributionController>()) {
      Get.delete<EditModernMeaningContributionController>();
    }
    if (Get.isRegistered<EditPhotoContributionController>()) {
      Get.delete<EditPhotoContributionController>();
    }
    if (Get.isRegistered<EditPoemContributionController>()) {
      Get.delete<EditPoemContributionController>();
    }
    if (Get.isRegistered<EditSlangContributionController>()) {
      Get.delete<EditSlangContributionController>();
    }
    if (Get.isRegistered<EditSynonymsContributionController>()) {
      Get.delete<EditSynonymsContributionController>();
    }
  }
}
