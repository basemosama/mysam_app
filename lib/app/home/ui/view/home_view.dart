part of '../imports/home_imports.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppTrans.home,
      child: RefreshIndicator(
        onRefresh: () async {
          controller.refreshPagination();
        },
        child: CustomScrollView(
          slivers: [
            const BuildHomeSearchWidget(),
            const BuildRootsListWidget(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12.0.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
