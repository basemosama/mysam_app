part of '../../../imports/my_contributions_imports.dart';

class BuildMyContributionsContributionItemWordsContributionWidget
    extends StatelessWidget {
  final String? label;
  final List<String> words;

  const BuildMyContributionsContributionItemWordsContributionWidget({
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
        ? BuildMyContributionsListItemFieldWidget(
            label: label!,
            child: chipsWidget,
          )
        : chipsWidget;
  }
}
