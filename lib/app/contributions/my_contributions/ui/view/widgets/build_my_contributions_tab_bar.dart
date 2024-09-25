part of '../../imports/my_contributions_imports.dart';

class BuildMyContributionsTabBar extends StatefulWidget {
  const BuildMyContributionsTabBar({super.key});

  @override
  State<BuildMyContributionsTabBar> createState() =>
      _BuildMyContributionsTabBarState();
}

class _BuildMyContributionsTabBarState
    extends State<BuildMyContributionsTabBar> {
  MyContributionsController get controller =>
      Get.find<MyContributionsController>();

  @override
  void initState() {
    super.initState();
    controller.tabController.addListener(_listenToTabController);
  }

  void _listenToTabController() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.surfaceContainerLow,
      child: TabBar(
        controller: controller.tabController,
        padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 4.r),
        isScrollable: true,
        tabAlignment: TabAlignment.center,
        indicator: CustomTabIndicator(
          controller: controller.tabController,
          colors: ContributionStatus.availableValues
              .map((e) => e.indicatorColor(context))
              .toList(),
        ),
        labelColor: context.colors.primary,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: List.generate(
          ContributionStatus.availableValues.length,
          (i) => Tab(
            text: ContributionStatus.availableValues[i].displayName
                .tr(context: context),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (Get.isRegistered<MyContributionsController>()) {
      controller.tabController.removeListener(_listenToTabController);
    }
    super.dispose();
  }
}
