part of '../../imports/reviews_imports.dart';

class BuildReviewsListItemWidget extends GetView<ReviewsController> {
  final Contribution contribution;
  final bool showStatus;

  const BuildReviewsListItemWidget({
    required this.contribution,
    this.showStatus = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
      margin: EdgeInsets.symmetric(horizontal: 4.r, vertical: 8.r),
      borderRadius: BorderRadius.circular(16.r),
      onPressed: () {
        controller.handleContributionTap(
          context: context,
          contribution: contribution,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildRootDetailsContributionUserWidget(
                      contribution: contribution,
                    ),
                    BuildReviewsListItemFieldWidget(
                      label: AppTrans.rootWordLabel,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.r,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0.r),
                        child: ActionChip(
                          onPressed: () {
                            controller.handleRootTap(
                              context: context,
                              contribution: contribution,
                            );
                          },
                          padding: EdgeInsets.zero,
                          label: CustomText(
                            contribution.root?.value ?? '-',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BuildContributionTypeChip(
                      contribution: contribution,
                      width: double.infinity,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.0.r,
              vertical: 4.0.r,
            ),
            child: BuildReviewsContributionItemByTypeWidget(
              contribution: contribution,
            ),
          ),
        ],
      ),
    );
  }
}
