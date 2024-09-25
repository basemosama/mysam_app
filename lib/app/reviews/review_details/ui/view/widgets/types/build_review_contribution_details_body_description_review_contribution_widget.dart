part of '../../../imports/review_details_imports.dart';

class BuildReviewContributionDetailsBodyDescriptionContributionWidget
    extends StatelessWidget {
  final String body;
  final String bodyLabel;
  final String? description;
  final String? descriptionLabel;

  const BuildReviewContributionDetailsBodyDescriptionContributionWidget({
    required this.body,
    this.description,
    required this.bodyLabel,
    this.descriptionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BuildReviewContributionDetailsForumWidget(
      label: body,
      subtitle: description,
      labelColor: context.colors.onSurface,
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     BuildReviewContributionDetailsForumWidget(
    //       label: bodyLabel,
    //       subtitle: body,
    //     ),
    //     BuildReviewContributionDetailsForumWidget(
    //       label: descriptionLabel ?? '',
    //       subtitle: description,
    //     ),
    //   ],
    // );
  }
}
