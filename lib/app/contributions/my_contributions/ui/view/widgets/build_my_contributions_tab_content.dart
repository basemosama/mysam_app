part of '../../imports/my_contributions_imports.dart';

class BuildMyContributionsTabContent
    extends GetView<MyContributionsController> {
  final ContributionStatus status;
  const BuildMyContributionsTabContent({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.pagingControllerByStatus(status).refresh();
      },
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.r,
            ),
            sliver: PagedSliverList<int, Contribution>(
              pagingController: controller.pagingControllerByStatus(status),
              builderDelegate: PagedChildBuilderDelegate<Contribution>(
                itemBuilder: (context, contribution, index) =>
                    BuildMyContributionsListItemWidget(
                  contribution: contribution,
                  showStatus: status == ContributionStatus.all,
                ),
                animateTransitions: true,
                firstPageErrorIndicatorBuilder: (_) => SizedBox(
                  height: context.height * .5,
                  child: const EmptyDataWidget(
                    error: AppTrans.noContributionsFound,
                    isScrollable: false,
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
