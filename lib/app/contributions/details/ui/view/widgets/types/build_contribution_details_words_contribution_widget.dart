part of '../../../imports/details_imports.dart';

class BuildContributionDetailsWordsContributionWidget extends StatelessWidget {
  final String? label;
  final List<String> words;

  const BuildContributionDetailsWordsContributionWidget({
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
        ? BuildContributionDetailsForumWidget(
            label: label!,
            child: chipsWidget,
          )
        : chipsWidget;
  }
}
