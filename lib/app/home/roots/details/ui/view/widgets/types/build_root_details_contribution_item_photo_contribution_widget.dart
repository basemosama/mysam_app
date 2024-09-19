part of '../../../imports/root_details_imports.dart';

class BuildRootDetailsContributionItemPhotoContributionWidget
    extends StatelessWidget {
  final PhotoContribution contribution;

  const BuildRootDetailsContributionItemPhotoContributionWidget({
    required this.contribution,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colors.subtitleTextColor ?? Colors.grey,
          width: 1.r,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
      margin: EdgeInsetsDirectional.only(
        end: 8.r,
      ),
      height: 100.r,
      child: ImageViewer.cachedNetwork(
        contribution.image?.url ?? '',
        width: double.infinity,
        errorBuilder: (ctx, _) => const PlaceholderImageWidget(),
      ),
    );
  }
}
