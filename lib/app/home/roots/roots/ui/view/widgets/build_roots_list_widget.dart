part of '../../imports/roots_imports.dart';

class BuildRootsListWidget extends GetView<RootsController> {
  const BuildRootsListWidget();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.r,
      ),
      sliver: PagedSliverList<int, Root>(
        pagingController: controller._pagingController,
        builderDelegate: PagedChildBuilderDelegate<Root>(
          itemBuilder: (context, root, index) => BuildRootsItemWidget(
            root: root,
          ),
          animateTransitions: true,
          firstPageErrorIndicatorBuilder: (_) => SizedBox(
            height: context.height * .5,
            child: const EmptyDataWidget(
              error: AppTrans.noRootsFound,
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
              error: AppTrans.noRootsFound,
            ),
          ),
        ),
      ),
    );
  }
}
