part of '../imports/roots_imports.dart';

class RootsController extends GetxController {
  final _repository = RootsRepository();

  final TextEditingController searchController = TextEditingController();

  final debouncedSearchText = ''.obs;
  final _searchText = ''.obs;

  final PagingController<int, Root> _pagingController =
      PagingController(firstPageKey: 1);

  Worker? _debounceWorker;

  @override
  void onInit() {
    super.onInit();
    setupSearchDebouncer();
    initPageController();
  }

  void setupSearchDebouncer() {
    _debounceWorker?.dispose();
    _debounceWorker = debounce(
      _searchText,
      (value) {
        debouncedSearchText.value = value;
        refreshPagination();
      },
      time: const Duration(milliseconds: 600),
    );
  }

  void initPageController() {
    _pagingController.addPageRequestListener((pageKey) {
      getRoots(page: pageKey, searchText: debouncedSearchText.value);
    });
  }

  void refreshPagination() {
    final notifyPage = _pagingController.value ==
        const PagingState<int, Root>(
          nextPageKey: 1,
        );

    _pagingController.refresh();
    if (notifyPage) {
      _pagingController.notifyPageRequestListeners(1);
    }
  }

  Future<void> getRoots({
    required int page,
    required String searchText,
  }) async {
    final res = await _repository.getRoots(page: page, searchText: searchText);
    res.when(
      success: (rootsWrapper) {
        final roots = rootsWrapper.data;
        final isLastPage = rootsWrapper.isLastPage;
        if (isLastPage) {
          _pagingController.appendLastPage(roots);
        } else {
          final nextPageKey = page + 1;
          _pagingController.appendPage(roots, nextPageKey);
        }
      },
      error: (error) {
        if (error is RequestCanceledException) return;
        _pagingController.error = error;
      },
    );
  }

  void handleRootClicked(Root root) {
    AppNavigation.navigateToRootDetails(root);
  }

  @override
  void onClose() {
    _debounceWorker?.dispose();
    searchController.dispose();

    super.onClose();
  }
}
