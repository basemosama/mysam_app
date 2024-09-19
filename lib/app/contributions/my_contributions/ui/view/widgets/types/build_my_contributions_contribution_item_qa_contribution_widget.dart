part of '../../../imports/my_contributions_imports.dart';

class BuildMyContributionsContributionItemQaContributionWidget
    extends StatelessWidget {
  final QAContribution contribution;

  const BuildMyContributionsContributionItemQaContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return BuildMyContributionsListItemFieldWidget(
      label: contribution.question,
      subtitle: contribution.answer,
      padding: EdgeInsets.zero,
      labelColor: context.colors.onSurface,
      subtitleFontSize: 12.sp,
      maxLines: 2,
    );
  }
}
