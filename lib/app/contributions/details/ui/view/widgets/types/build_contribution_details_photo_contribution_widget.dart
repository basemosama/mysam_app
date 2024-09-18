part of '../../../imports/details_imports.dart';

class BuildContributionDetailsPhotoContributionWidget extends StatelessWidget {
  final PhotoContribution contribution;

  const BuildContributionDetailsPhotoContributionWidget({
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
      height: 200.r,
      child: ImageViewer.cachedNetwork(
        contribution.image?.url ?? '',
        fit: BoxFit.cover,
        width: double.infinity,
        errorBuilder: (ctx, _) => const PlaceholderImageWidget(),
      ),
    );
  }
}
