part of '../../imports/root_details_imports.dart';

class BuildRootDetailsContributionUserWidget extends StatelessWidget {
  final Contribution contribution;

  const BuildRootDetailsContributionUserWidget({
    required this.contribution,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: context.colors.filledColor,
              child: ClipOval(
                child: ImageViewer.cachedNetwork(
                  contribution.createdBy?.image?.url ?? '',
                  errorBuilder: (context, error) => PlaceholderImageWidget(
                    path: Assets.images.profilePlaceholder,
                    color: context.colors.subtitleTextColor,
                    padding: EdgeInsets.zero,
                  ),
                  placeholderBuilder: (context) => PlaceholderImageWidget(
                    path: Assets.images.profilePlaceholder,
                    color: context.colors.subtitleTextColor,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.r),
            CustomText(
              contribution.createdBy?.getFullName(fallbackAsEmail: false) ??
                  AppTrans.unknown,
              color: context.colors.onSurface,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 6.r),
        CustomText(
          AppUtils.getFormattedTimeAgo(time: contribution.createdAt),
          color: context.colors.subtitleTextColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
