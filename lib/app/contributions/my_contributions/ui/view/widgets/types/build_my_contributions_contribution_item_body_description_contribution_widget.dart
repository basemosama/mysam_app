part of '../../../imports/my_contributions_imports.dart';

class BuildMyContributionsContributionItemBodyDescriptionContributionWidget
    extends StatelessWidget {
  final String body;
  final String bodyLabel;
  final String? description;
  final String? descriptionLabel;

  const BuildMyContributionsContributionItemBodyDescriptionContributionWidget({
    required this.body,
    this.description,
    required this.bodyLabel,
    this.descriptionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BuildMyContributionsListItemFieldWidget(
      label: body,
      subtitle: description,
      padding: EdgeInsets.zero,
      labelColor: context.colors.primary.withOpacity(0.7),
      maxLines: 2,
    );
  }
}
