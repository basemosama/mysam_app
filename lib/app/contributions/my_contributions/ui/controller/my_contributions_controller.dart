part of '../imports/my_contributions_imports.dart';

class MyContributionsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final _repository = MyContributionsRepository();

  late final tabController = TabController(
    length: ContributionStatus.values.length,
    vsync: this,
  );

  final allPagingController = PagingController<int, Contribution>(
    firstPageKey: 1,
  );
  final pendingPagingController = PagingController<int, Contribution>(
    firstPageKey: 1,
  );

  final acceptedPagingController = PagingController<int, Contribution>(
    firstPageKey: 1,
  );

  final declinedPagingController = PagingController<int, Contribution>(
    firstPageKey: 1,
  );

  late final tabsPagingControllers = {
    ContributionStatus.all: allPagingController,
    ContributionStatus.pending: pendingPagingController,
    ContributionStatus.confirmed: acceptedPagingController,
    ContributionStatus.declined: declinedPagingController,
  };

  PagingController<int, Contribution> pagingControllerByStatus(
    ContributionStatus status,
  ) =>
      tabsPagingControllers[status]!;

  CancelToken? _allCancelToken;
  CancelToken? _pendingCancelToken;
  CancelToken? _confirmedCancelToken;
  CancelToken? _declinedCancelToken;

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
    for (final entry in tabsPagingControllers.entries) {
      final status = entry.key;
      final pagingController = entry.value;

      pagingController.addPageRequestListener((pageKey) {
        getContributions(page: pageKey, status: status);
      });
    }

    tabController.addListener(() {
      currentStatus.value =
          ContributionStatus.availableValues[tabController.index];
    });
  }

  void _listenToSearchAndStatus() {
    _getContributionsWorker?.dispose();
    _getContributionsWorker = everAll([
      searchText,
    ], (_) {
      refreshPagination(status: ContributionStatus.all);
      refreshPagination(status: ContributionStatus.pending);
      refreshPagination(status: ContributionStatus.confirmed);
      refreshPagination(status: ContributionStatus.declined);
    });
  }

  Future<void> getContributions({
    required int page,
    required ContributionStatus status,
  }) async {
    final search = searchText.value;

    final token = _updateCancelTokenByStatus(status);
    final res = await _repository.getMyContributions(
      page: page,
      search: search,
      status: status,
      cancelToken: token,
    );

    res.when(
      success: (data) {
        final isLastPage = data.isLastPage;
        if (isLastPage) {
          pagingControllerByStatus(status).appendLastPage(data.data);
        } else {
          pagingControllerByStatus(status).appendPage(data.data, page + 1);
        }
      },
      error: (error) {
        if (error is RequestCanceledException) {
          return;
        }
        pagingControllerByStatus(status).error = error;
      },
    );
  }

  void refreshPagination({required ContributionStatus status}) {
    cancelRequests();
    pagingControllerByStatus(status).itemList = [];
    pagingControllerByStatus(status).refresh();
  }

  CancelToken _updateCancelTokenByStatus(ContributionStatus status) {
    switch (status) {
      case ContributionStatus.all:
        _allCancelToken = CancelToken();
        return _allCancelToken!;
      case ContributionStatus.pending:
        _pendingCancelToken = CancelToken();
        return _pendingCancelToken!;
      case ContributionStatus.confirmed:
        _confirmedCancelToken = CancelToken();
        return _confirmedCancelToken!;
      case ContributionStatus.declined:
        _declinedCancelToken = CancelToken();
        return _declinedCancelToken!;
    }
  }

  void cancelRequests() {
    _allCancelToken?.cancel();
    _pendingCancelToken?.cancel();
    _confirmedCancelToken?.cancel();
    _declinedCancelToken?.cancel();
  }

  void handleContributionTap({
    required BuildContext context,
    required Contribution contribution,
  }) {
    if (contribution.root == null) {
      return;
    }
    ContributionDetailsController.showModal(
      context: context,
      contribution: contribution,
      root: contribution.root!,
    );
  }

  @override
  void onClose() {
    _getContributionsWorker?.dispose();
    searchController.dispose();
    cancelRequests();
    super.onClose();
  }
}
