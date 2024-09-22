part of '../imports/reviews_imports.dart';

class ReviewsController extends GetxController {
  final _repository = ReviewsRepository();

  final pagingController = PagingController<int, Contribution>(
    firstPageKey: 1,
  );

  CancelToken? _cancelToken;

  final searchController = TextEditingController();
  final searchText = ''.obs;

  final currentStatus = Rx<ContributionStatus>(ContributionStatus.all);

  Worker? _getContributionsWorker;

  @override
  void onInit() {
    super.onInit();
    _setupPagination();
    _listenToSearchAndStatus();
  }

  void _setupPagination() {
    pagingController.addPageRequestListener((pageKey) {
      getContributions(page: pageKey, status: currentStatus.value);
    });
  }

  void _listenToSearchAndStatus() {
    _getContributionsWorker?.dispose();
    _getContributionsWorker = everAll([searchText, currentStatus], (_) {
      refreshPagination();
    });
  }

  Future<void> getContributions({
    required int page,
    required ContributionStatus status,
  }) async {
    final search = searchText.value;
    final token = CancelToken();
    final res = await _repository.getContributions(
      page: page,
      search: search,
      status: status,
      cancelToken: token,
    );

    res.when(
      success: (data) {
        final isLastPage = data.isLastPage;
        if (isLastPage) {
          pagingController.appendLastPage(data.data);
        } else {
          pagingController.appendPage(data.data, page + 1);
        }
      },
      error: (error) {
        if (error is RequestCanceledException) {
          return;
        }
        pagingController.error = error;
      },
    );
  }

  void refreshPagination() {
    cancelRequests();
    final notifyPage = pagingController.value ==
        const PagingState<int, Contribution>(
          nextPageKey: 1,
        );

    pagingController.refresh();
    if (notifyPage) {
      pagingController.notifyPageRequestListeners(1);
    }
  }

  void cancelRequests() {
    _cancelToken?.cancel();
  }

  void handleContributionTap({
    required BuildContext context,
    required Contribution contribution,
  }) {
    if (contribution.root == null) {
      return;
    }
    AppNavigation.navigateToReviewDetails(contribution);
  }

  void handleRootTap({
    required BuildContext context,
    required Contribution contribution,
  }) {
    if (contribution.root == null) {
      return;
    }

    AppNavigation.navigateToRootDetails(contribution.root!);
  }

  @override
  void onClose() {
    _getContributionsWorker?.dispose();
    searchController.dispose();
    cancelRequests();
    super.onClose();
  }
}
