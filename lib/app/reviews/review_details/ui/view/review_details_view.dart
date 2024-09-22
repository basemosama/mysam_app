part of '../imports/review_details_imports.dart';

class ReviewDetailsView extends GetView<ReviewDetailsController> {
  const ReviewDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppTrans.reviews,
      leading: AppBarLeadingType.back,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.r,
          vertical: 4.r,
        ),
        child: RxDataStateWidget(
          rxData: controller.contributionState,
          onSuccess: (contribution) {
            final properties = contribution.relatedWord.metadata ?? [];
            return OptimizedScrollView(
              child: Column(
                children: [
                  Dismissible(
                    key: Key(contribution.documentId),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        controller.declineContribution();
                      } else {
                        controller.acceptContribution();
                      }
                      return false;
                    },
                    background: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: context.colors.error,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.r,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 6.r),
                      child: Row(
                        children: [
                          Icon(
                            Icons.close,
                            color: context.colors.onError,
                            size: 30.r,
                          ),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: context.colors.primary,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.r,
                      ),
                      margin: EdgeInsets.symmetric(vertical: 6.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.check,
                            color: context.colors.onPrimary,
                            size: 30.r,
                          ),
                        ],
                      ),
                    ),
                    child: CustomCard(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.0.r,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.0.r,
                                        vertical: 8.0.r,
                                      ),
                                      child:
                                          BuildRootDetailsContributionUserWidget(
                                        contribution: contribution,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.0.r,
                                      vertical: 8.0.r,
                                    ),
                                    child: BuildContributionTypeChip(
                                      contribution: contribution,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BuildReviewContributionDetailsForumWidget(
                              label: AppTrans.rootWordLabel,
                              subtitle: contribution.root?.value,
                            ),
                            BuildReviewContributionDetailsForumWidget(
                              label: AppTrans.keywordLabel,
                              subtitle: contribution.relatedWord.word,
                            ),
                            BuildReviewContributionDetailsForumWidget(
                              label: AppTrans.keywordWeightLabel,
                              subtitle: contribution.relatedWord.weight,
                            ),
                            BuildReviewContributionDetailsForumWidget(
                              label: AppTrans.keywordTypeLabel,
                              subtitle:
                                  contribution.relatedWord.type?.displayName,
                              isSubtitleTranslatable: true,
                            ),
                            BuildReviewContributionDetailsForumWidget(
                              label: AppTrans.keywordPropertiesLabel,
                              child: properties.isNotEmpty
                                  ? BuildReviewContributionDetailsWordsContributionWidget(
                                      words: properties,
                                    )
                                  : null,
                            ),
                            BuildReviewContributionDetailsForumWidget(
                              label: AppTrans.contributionDetailsLabel,
                              child:
                                  BuildReviewContributionDetailsContributionByTypeWidget(
                                contribution: contribution,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0.r, vertical: 16.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomIconButton(
                          iconInfo: IconInfo(icon: Icons.check),
                          onPressed: controller.acceptContribution,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.r,
                            vertical: 16.r,
                          ),
                          backgroundColor: context.colors.primary,
                        ),
                        CustomIconButton(
                          iconInfo: IconInfo(icon: Icons.edit_outlined),
                          onPressed: controller.editContribution,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.r,
                            vertical: 16.r,
                          ),
                        ),
                        CustomIconButton(
                          iconInfo: IconInfo(
                            icon: Icons.close,
                            color: context.colors.onError,
                          ),
                          onPressed: controller.declineContribution,
                          backgroundColor: context.colors.error,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.r,
                            vertical: 16.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
