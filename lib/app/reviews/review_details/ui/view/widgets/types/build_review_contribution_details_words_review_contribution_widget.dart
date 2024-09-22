part of '../../../imports/review_details_imports.dart';

class BuildReviewContributionDetailsWordsContributionWidget
    extends StatelessWidget {
  final String? label;
  final List<String> words;

  const BuildReviewContributionDetailsWordsContributionWidget({
    required this.words,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final chipsWidget = Wrap(
      children: words
          .map(
            (word) => FeatureChip(
              label: word,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
          .toList(),
    );

    return label?.isNotEmpty == true
        ? BuildReviewContributionDetailsForumWidget(
            label: label!,
            child: chipsWidget,
          )
        : chipsWidget;
  }
}
