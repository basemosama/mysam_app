part of '../imports/details_imports.dart';

class ContributionDetailsView extends StatelessWidget {
  final ContributionDetailsController controller;

  const ContributionDetailsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final properties = controller.contribution.relatedWord.metadata ?? [];
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0.r,
        vertical: 8.0.r,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.r,
              vertical: 8.0.r,
            ),
            child: BuildRootDetailsContributionUserWidget(
              contribution: controller.contribution,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.r,
              vertical: 8.0.r,
            ),
            child: Wrap(
              spacing: 8.0.r,
              children: [
                BuildContributionTypeChip(
                  contribution: controller.contribution,
                ),
                BuildContributionStatusChip(
                  contribution: controller.contribution,
                ),
              ],
            ),
          ),
          BuildContributionDetailsForumWidget(
            label: AppTrans.rootWordLabel,
            subtitle: controller.root.value,
          ),
          BuildContributionDetailsForumWidget(
            label: AppTrans.keywordLabel,
            subtitle: controller.contribution.relatedWord.word,
          ),
          BuildContributionDetailsForumWidget(
            label: AppTrans.keywordWeightLabel,
            subtitle: controller.contribution.relatedWord.weight,
          ),
          BuildContributionDetailsForumWidget(
            label: AppTrans.keywordTypeLabel,
            subtitle: controller.contribution.relatedWord.type?.displayName,
          ),
          BuildContributionDetailsForumWidget(
            label: AppTrans.keywordPropertiesLabel,
            child: properties.isNotEmpty
                ? BuildContributionDetailsWordsContributionWidget(
                    words: properties,
                  )
                : null,
          ),
          BuildContributionDetailsForumWidget(
            label: AppTrans.contributionDetailsLabel,
            child: BuildContributionDetailsContributionByTypeWidget(
              contribution: controller.contribution,
            ),
          ),
        ]),
      ),
    );
  }

  static SliverWoltModalSheetPage buildPage({
    required BuildContext context,
    required ContributionDetailsController controller,
    required Contribution contribution,
    required bool showEdit,
  }) {
    return CustomModal.buildCustomModalPage(
      title: controller.root.value,
      body: ContributionDetailsView(
        controller: controller,
      ),
      leading: showEdit && contribution.status == ContributionStatus.pending ||
              contribution.status == ContributionStatus.declined
          ? IconButton(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
              visualDensity: VisualDensity.comfortable,
              onPressed: () {
                controller.editContribution();
              },
              icon: Icon(
                Icons.edit_outlined,
                color: context.colors.onSurface,
              ),
            )
          : null,
      onClosePressed: () {
        PlayxNavigation.pop();
      },
      context: context,
    );
  }
}
