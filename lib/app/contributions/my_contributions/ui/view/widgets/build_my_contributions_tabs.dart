part of '../../imports/my_contributions_imports.dart';

class BuildMyContributionsTabs extends GetView<MyContributionsController> {
  const BuildMyContributionsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller.tabController,
      children: List.generate(
        ContributionStatus.availableValues.length,
        (i) => BuildMyContributionsTabContent(
          status: ContributionStatus.availableValues[i],
          key: Key(ContributionStatus.availableValues[i].toString()),
        ),
      ),
    );
  }
}
