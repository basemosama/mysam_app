part of '../../../imports/details_imports.dart';

class BuildContributionDetailsQaContributionWidget extends StatelessWidget {
  final QAContribution contribution;

  const BuildContributionDetailsQaContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BuildContributionDetailsForumWidget(
          label: AppTrans.questionLabel,
          subtitle: contribution.question,
        ),
        BuildContributionDetailsForumWidget(
          label: AppTrans.answerLabel,
          subtitle: contribution.answer,
        ),
      ],
    );
  }
}
