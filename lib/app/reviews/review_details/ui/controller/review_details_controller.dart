part of '../imports/review_details_imports.dart';

class ReviewDetailsController extends GetxController {
  final Contribution contribution;

  ReviewDetailsController({required this.contribution});

  final _repository = ReviewDetailsRepository();

  CustomNavigationDrawerController get drawerController =>
      Get.find<CustomNavigationDrawerController>();

  RxDataState<Contribution> contributionState =
      RxDataState<Contribution>(const DataState.initial());

  @override
  void onInit() {
    super.onInit();
    getContribution();
  }

  Future<void> getContribution() async {
    contributionState.value = const DataState.loading();
    final res = await _repository.getContribution(contribution: contribution);
    res.when(
      success: (data) {
        contributionState.value = DataState.success(data);
      },
      error: (error) {
        contributionState.value = DataState.fromNetworkError(error);
      },
    );
  }

  Future<void> acceptContribution() async {
    drawerController.updateLoadingStatus(isLoading: true);
    final res =
        await _repository.acceptContribution(contribution: contribution);
    res.when(
      success: (data) {
        Alert.success(message: AppTrans.contributionAcceptedMessage.tr());
        drawerController.updateLoadingStatus(isLoading: false);
        if (Get.isRegistered<ReviewsController>()) {
          Get.find<ReviewsController>().refreshPagination();
        }

        AppNavigation.navigateToReviews();
      },
      error: (error) {
        drawerController.updateLoadingStatus(isLoading: false);
        Alert.error(message: error.message);
      },
    );
  }

  Future<void> declineContribution() async {
    drawerController.updateLoadingStatus(isLoading: true);
    final res =
        await _repository.rejectContribution(contribution: contribution);
    res.when(
      success: (data) {
        Alert.success(message: AppTrans.contributionDeclinedMessage.tr());
        drawerController.updateLoadingStatus(isLoading: false);
        if (Get.isRegistered<ReviewsController>()) {
          Get.find<ReviewsController>().refreshPagination();
        }
        AppNavigation.navigateToReviews();
      },
      error: (error) {
        drawerController.updateLoadingStatus(isLoading: false);
        Alert.error(message: error.message);
      },
    );
  }

  void editContribution() {
    if (contribution.root == null) {
      return;
    }
    AppNavigation.navigateToEditContribution(
      contribution: contribution,
      root: contribution.root!,
    );
  }

  void refreshContribution() {}
}
