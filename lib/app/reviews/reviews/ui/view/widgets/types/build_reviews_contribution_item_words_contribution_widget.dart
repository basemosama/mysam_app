part of '../../../imports/reviews_imports.dart';

class BuildReviewsContributionItemWordsContributionWidget
    extends StatelessWidget {
  final String? label;
  final List<String> words;

  const BuildReviewsContributionItemWordsContributionWidget({
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
        ? BuildReviewsListItemFieldWidget(
            label: label!,
            separator: '\n',
            padding: EdgeInsets.zero,
            child: chipsWidget,
          )
        : chipsWidget;
  }
}
