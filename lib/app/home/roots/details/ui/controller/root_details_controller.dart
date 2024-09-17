part of '../imports/root_details_imports.dart';

class RootDetailsController extends GetxController {
  Root root;

  RootDetailsController({required this.root});

  final _repository = RootDetailsRepository();

  final dataState = RxDataState<Root>(const DataState.initial());

  @override
  void onInit() {
    super.onInit();
    getRootDetails();
  }

  Future<void> getRootDetails() async {
    dataState.value = const DataState.loading();
    final res = await _repository.getRootDetails(root.documentId);
    res.when(
      success: (data) {
        if (data.contributionsCount == 0) {
          dataState.value = DataState.fromEmptyError();
        } else {
          dataState.value = DataState.success(data);
        }
      },
      error: (error) {
        dataState.value = DataState.fromNetworkError(error);
      },
    );
  }

  Future<void> refreshRoot() async {
    getRootDetails();
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
