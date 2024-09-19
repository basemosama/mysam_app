part of '../../../imports/root_details_imports.dart';

class BuildRootDetailsContributionItemQaContributionWidget
    extends StatelessWidget {
  final QAContribution contribution;

  const BuildRootDetailsContributionItemQaContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return BuildMyContributionsListItemFieldWidget(
      label: contribution.question,
      subtitle: contribution.answer,
      padding: EdgeInsets.zero,
      labelColor: context.colors.subtitleTextColor,
      maxLines: 1,
    );
  }
}
