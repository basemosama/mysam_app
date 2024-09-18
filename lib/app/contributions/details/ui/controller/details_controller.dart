part of '../imports/details_imports.dart';

class ContributionDetailsController extends GetxController {
  final Contribution contribution;
  final Root root;

  ContributionDetailsController({
    required this.contribution,
    required this.root,
  });
  @override
  void onInit() {
    super.onInit();
  }

  static Future<void> showModal(
      {required BuildContext context,
      required Contribution contribution,
      required Root root}) async {
    final controller = ContributionDetailsController(
      contribution: contribution,
      root: root,
    );
    await CustomModal.showPageModal(
      context: context,
      pageBuilder: (ctx) => ContributionDetailsView.buildPage(
        context: ctx,
        controller: controller,
      ),
    );
    controller.onClose();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
