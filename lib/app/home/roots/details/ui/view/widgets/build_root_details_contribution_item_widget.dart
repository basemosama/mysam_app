part of '../../imports/root_details_imports.dart';

class BuildRootDetailsContributionItemWidget
    extends GetView<RootDetailsController> {
  final Contribution contribution;
  const BuildRootDetailsContributionItemWidget({
    required this.contribution,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 12.r),
      onPressed: () => controller.handleContributionTap(
          contribution: contribution, context: context,),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildRootDetailsContributionUserWidget(
                  contribution: contribution,
                ),
                SizedBox(height: 4.r),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.r),
                  child: BuildRootDetailsContributionItemByTypeWidget(
                      contribution: contribution,),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 6.r,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BuildContributionTypeChip(
                  contribution: contribution,
                  width: double.infinity,
                ),
                BuildContributionStatusChip(
                  contribution: contribution,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
