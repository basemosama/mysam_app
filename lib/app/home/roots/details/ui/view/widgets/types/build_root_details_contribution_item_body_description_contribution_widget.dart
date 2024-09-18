part of '../../../imports/root_details_imports.dart';

class BuildRootDetailsContributionItemBodyDescriptionContributionWidget
    extends StatelessWidget {
  final String body;
  final String bodyLabel;
  final String? description;
  final String? descriptionLabel;

  const BuildRootDetailsContributionItemBodyDescriptionContributionWidget({
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
      labelColor: context.colors.subtitleTextColor,
      maxLines: 1,
    );
  }
}
