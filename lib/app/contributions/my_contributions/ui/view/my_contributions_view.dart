part of '../imports/my_contributions_imports.dart';

class MyContributionsView extends GetView<MyContributionsController> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppTrans.myContributions,
      child: Column(
        children: [
          const BuildMyContributionsTabBar(),
          SizedBox(
            height: 8.r,
          ),
          const Expanded(
            child: BuildMyContributionsTabs(),
          ),
        ],
      ),
    );
  }
}
