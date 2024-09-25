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
        indicatorColor: context.colors.secondaryContainer,
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: context.colors.surface,
        items: controller.items
            .mapWithIndex(
              (index, item) => NavigationDestination(
                icon: item.iconWidget ??
                    item.icon.buildIconWidget(
                      color: controller.currentIndex == index
                          ? context.colors.onSecondaryContainer
                          : context.colors.subtitleTextColor,
                    ),
                label: item.label.tr(context: context),
              ),
            )
            .toList(),
      );
    },
    cupertino: (context, _) {
      return CupertinoTabBarData(
        activeColor: context.colors.primary,
        items: controller.items
            .mapWithIndex(
              (index, item) => BottomNavigationBarItem(
                icon: item.iconWidget ??
                    item.icon.buildIconWidget(
                      color: controller.currentIndex == index
                          ? context.colors.primary
                          : context.colors.subtitleTextColor,
                    ),
                label: item.label.tr(context: context),
              ),
            )
            .toList(),
      );
    },
  );
}
