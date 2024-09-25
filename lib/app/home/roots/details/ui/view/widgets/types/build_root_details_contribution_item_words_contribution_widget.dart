part of '../../../imports/root_details_imports.dart';

class BuildRootDetailsContributionItemWordsContributionWidget
    extends StatelessWidget {
  final List<String> words;

  const BuildRootDetailsContributionItemWordsContributionWidget({
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
  }
}
