part of '../imports/bottom_navigation_imports.dart';

PlatformNavBar buildCustomNavigationBar({
  required BuildContext context,
  required StatefulNavigationShell navigationShell,
}) {
  final controller = Get.find<CustomBottomNavigationController>();
  controller.updateIndex(navigationShell.currentIndex);

  return PlatformNavBar(
    currentIndex: controller.currentIndex,
    itemChanged: (index) {
      controller.handleItemChanged(
        index: index,
        navigationShell: navigationShell,
      );
    },
    material3: (context, platform) {
      return MaterialNavigationBarData(
        indicatorColor: context.colors.primary,
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: context.colors.surface,
        items: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: controller.currentIndex == 0
                  ? context.colors.onPrimary
                  : context.colors.subtitleTextColor,
            ),
            label: AppTrans.home.tr(context: context),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.star,
              color: controller.currentIndex == 1
                  ? context.colors.onPrimary
                  : context.colors.subtitleTextColor,
            ),
            label: AppTrans.contributions.tr(context: context),
          ),
          NavigationDestination(
            icon: _buildProfileImage(context: context, controller: controller),
            label: AppTrans.profile.tr(context: context),
          ),
        ],
      );
    },
    cupertino: (context, _) {
      return CupertinoTabBarData(
        activeColor: context.colors.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: controller.currentIndex == 0
                  ? context.colors.primary
                  : context.colors.subtitleTextColor,
            ),
            label: AppTrans.home.tr(context: context),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: controller.currentIndex == 1
                  ? context.colors.onPrimary
                  : context.colors.subtitleTextColor,
            ),
            label: AppTrans.contributions.tr(context: context),
          ),
          BottomNavigationBarItem(
            icon: _buildProfileImage(context: context, controller: controller),
            label: AppTrans.profile.tr(context: context),
          ),
        ],
      );
    },
  );
}

Widget _buildProfileImage(
    {required BuildContext context,
    required CustomBottomNavigationController controller}) {
  return CircleAvatar(
    radius: 14,
    backgroundColor: controller.currentIndex == 3
        ? context.colors.primary
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
