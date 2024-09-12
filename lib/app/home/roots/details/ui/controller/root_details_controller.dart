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
      pageBuilder: (ctx) => BuildChooseContributionTypeWidget.buildPage(ctx),
    );
  }
}
