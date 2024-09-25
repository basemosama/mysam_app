part of '../../imports/reviews_imports.dart';

class BuildReviewsListWidget extends GetView<ReviewsController> {
  const BuildReviewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshPagination();
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.r,
            ),
            sliver: PagedSliverList<int, Contribution>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Contribution>(
                itemBuilder: (context, contribution, index) =>
                    BuildReviewsListItemWidget(
                  contribution: contribution,
                ),
                animateTransitions: true,
                firstPageErrorIndicatorBuilder: (_) => SizedBox(
                  height: context.height * .5,
                  child: EmptyDataWidget(
                    error:
                        (controller.pagingController.error as NetworkException)
                            .message,
                    isScrollable: false,
                    errorColor: context.colors.error,
                  ),
                ),
                firstPageProgressIndicatorBuilder: (_) => const CustomLoading(),
                newPageProgressIndicatorBuilder: (_) => Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: const CenterLoading.adaptive(),
                ),
                noItemsFoundIndicatorBuilder: (_) => SizedBox(
                  height: context.height * .5,
                  child: const EmptyDataWidget(
                    error: AppTrans.noContributionsFound,
                    isScrollable: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
