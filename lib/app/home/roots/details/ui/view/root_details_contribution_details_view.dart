part of '../imports/root_details_imports.dart';

class RootDetailsContributionDetailsView extends StatelessWidget {
  final Root root;
  final Contribution contribution;

  const RootDetailsContributionDetailsView({
    required this.root,
    required this.contribution,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                contribution: contribution),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0.r,
              vertical: 8.0.r,
            ),
            child: Wrap(
              spacing: 8.0.r,
              children: [
                BuildContributionTypeChip(contribution: contribution),
                BuildContributionStatusChip(contribution: contribution),
              ],
            ),
          ),
          BuildRootContributionDetailsItemWidget(
            label: AppTrans.rootWordLabel,
            subtitle: root.value,
          ),
          BuildRootContributionDetailsItemWidget(
            label: AppTrans.keywordLabel,
            subtitle: contribution.relatedWord.word,
          ),
          BuildRootContributionDetailsItemWidget(
            label: AppTrans.keywordWeightLabel,
            subtitle: contribution.relatedWord.weight,
          ),
          BuildRootContributionDetailsItemWidget(
            label: AppTrans.keywordTypeLabel,
            subtitle: contribution.relatedWord.type?.displayName,
          ),
          BuildRootContributionDetailsItemWidget(
            label: AppTrans.keywordPropertiesLabel,
            subtitle: contribution.relatedWord.metadata?.join(', '),
          ),
          BuildRootContributionDetailsItemWidget(
            label: AppTrans.contributionDetailsLabel,
            subtitle: contribution.title,
          ),
        ]),
      ),
    );
  }

  static SliverWoltModalSheetPage buildPage({
    required BuildContext context,
    required Root root,
    required Contribution contribution,
  }) {
    return CustomModal.buildCustomModalPage(
      title: root.value,
      body: RootDetailsContributionDetailsView(
        root: root,
        contribution: contribution,
      ),
      onClosePressed: () {
        PlayxNavigation.pop();
      },
      context: context,
    );
  }
}
