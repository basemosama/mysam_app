part of '../../imports/bottom_navigation_imports.dart';

class BuildBottomNavProfileImageWidget
    extends GetView<CustomBottomNavigationController> {
  const BuildBottomNavProfileImageWidget();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: controller.currentIndex == controller.items.length
          ? PlayxPlatform.isIOS
              ? context.colors.primary
              : context.colors.onSecondaryContainer
          : context.colors.onSurface,
      child: CircleAvatar(
        radius: 13,
        backgroundColor: context.colors.surface,
        child: ClipOval(
          child: Obx(() {
            final user = controller.userInfo.value;
            return ImageViewer.cachedNetwork(
              user?.image?.url ?? '',
              errorBuilder: (context, error) => PlaceholderImageWidget(
                path: Assets.images.profilePlaceholder,
                padding: EdgeInsets.zero,
              ),
              placeholderBuilder: (context) => PlaceholderImageWidget(
                path: Assets.images.profilePlaceholder,
                padding: EdgeInsets.zero,
              ),
            );
          }),
        ),
      ),
    );
  }
}
