part of '../../imports/my_contributions_imports.dart';

class BuildMyContributionsListItemWidget
    extends GetView<MyContributionsController> {
  final Contribution contribution;
  final bool showStatus;
  const BuildMyContributionsListItemWidget({
    required this.contribution,
    this.showStatus = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      margin: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
      borderRadius: BorderRadius.circular(16.r),
      onPressed: () {
        controller.handleContributionTap(
            context: context, contribution: contribution);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.r, vertical: 4.r),
                      child: CustomText(
                        contribution.root?.value ?? '-',
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.r, vertical: 4.r),
                      child: CustomText(
                        AppUtils.getFormattedTimeAgo(
                            time: contribution.createdAt),
                        fontSize: 12.sp,
                        color: context.colors.subtitleTextColor,
                      ),
                    ),
                    BuildMyContributionsListItemFieldWidget(
                      label: AppTrans.keywordLabel,
                      subtitle: contribution.relatedWord.word,
                    ),
                    BuildMyContributionsListItemFieldWidget(
                      label: AppTrans.keywordWeightLabel,
                      subtitle: contribution.relatedWord.weight,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: BuildContributionTypeChip(
                            contribution: contribution,
                            width: double.infinity,
                          ),
                        ),
                        // IconButton(
                        //   visualDensity: VisualDensity.compact,
                        //   onPressed: () {
                        //     // controller.editContribution(contribution);
                        //   },
                        //   icon: Icon(
                        //     Icons.edit_outlined,
                        //     color: context.colors.primary,
                        //   ),
                        // ),
                      ],
                    ),
                    if (showStatus) ...[
                      SizedBox(height: 8.r),
                      BuildContributionStatusChip(
                        contribution: contribution,
                        width: double.infinity,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          BuildMyContributionsListItemFieldWidget(
            label: AppTrans.contributionDetailsLabel,
            subtitle: contribution.title,
          ),
        ],
      ),
    );
  }
}
