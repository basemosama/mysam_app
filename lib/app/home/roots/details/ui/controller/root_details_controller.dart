part of '../imports/root_details_imports.dart';

class RootDetailsController extends GetxController {
  Root root;

  RootDetailsController({required this.root});

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> contributeToRoot({required BuildContext context}) async {
    await CustomModal.showPageModal(
      context: context,
      pageBuilder: (ctx) => BuildChooseContributionTypeWidget.buildPage(
        context: ctx,
        onTypeSelected: (type) {
          handleContributionTypeSelected(type);
        },
      ),
    );
  }

  Future<void> handleContributionTypeSelected(ContributionType type) async {
    PlayxNavigation.pop();
    await Future.delayed(const Duration(milliseconds: 300));
    AppNavigation.navigateToCreateContribution(root: root, type: type);
  }
}
