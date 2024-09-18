part of '../../../imports/details_imports.dart';

class BuildContributionDetailsBodyDescriptionContributionWidget
    extends StatelessWidget {
  final String body;
  final String bodyLabel;
  final String? description;
  final String? descriptionLabel;

  const BuildContributionDetailsBodyDescriptionContributionWidget({
    required this.body,
    this.description,
    required this.bodyLabel,
    this.descriptionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionDetailsForumWidget(
      label: body,
      subtitle: description,
      labelColor: context.colors.onSurface,
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     BuildContributionDetailsForumWidget(
    //       label: bodyLabel,
    //       subtitle: body,
    //     ),
    //     BuildContributionDetailsForumWidget(
    //       label: descriptionLabel ?? '',
    //       subtitle: description,
    //     ),
    //   ],
    // );
  }
}
