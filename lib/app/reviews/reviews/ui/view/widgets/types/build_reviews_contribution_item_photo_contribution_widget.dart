part of '../../../imports/reviews_imports.dart';

class BuildReviewsContributionItemPhotoContributionWidget
    extends StatelessWidget {
  final PhotoContribution contribution;

  const BuildReviewsContributionItemPhotoContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colors.subtitleTextColor ?? Colors.grey,
          width: 1.r,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      height: 150.r,
      child: ImageViewer.cachedNetwork(
        contribution.image?.url ?? '',
        width: double.infinity,
        errorBuilder: (ctx, _) => const PlaceholderImageWidget(),
      ),
    );
  }
}
