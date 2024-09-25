part of '../imports/bottom_navigation_imports.dart';

class CustomBottomNavigationController extends GetxController {
  int currentIndex = 0;
  final userInfo = Rxn<UserInfo>();
  final showBottomNav = true.obs;
  final roleType = Rxn<UserRoleType>();
  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  UserRoleType get userRoleType => roleType.value ?? UserRoleType.user;

  final RxList<CustomNavigationDestinationItem> items =
      RxList<CustomNavigationDestinationItem>();

  final List<CustomNavigationDestinationItem> _moderatorItems = [
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.home_outlined,
      ),
      label: AppTrans.home,
      navigationIndex: 0,
    ),
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.edit_outlined,
      ),
      label: AppTrans.reviews,
      navigationIndex: 1,
    ),
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.star_outline,
      ),
      label: AppTrans.contributions,
      navigationIndex: 2,
    ),
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.person_outline,
      ),
      iconWidget: const BuildBottomNavProfileImageWidget(),
      label: AppTrans.profile,
      navigationIndex: 3,
    ),
  ];

  final List<CustomNavigationDestinationItem> _userItems = [
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.home_outlined,
      ),
      label: AppTrans.home,
      navigationIndex: 0,
    ),
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.star_outline,
      ),
      label: AppTrans.contributions,
      navigationIndex: 2,
    ),
    CustomNavigationDestinationItem(
      icon: IconInfo(
        icon: Icons.person_outline,
      ),
      iconWidget: const BuildBottomNavProfileImageWidget(),
      label: AppTrans.profile,
      navigationIndex: 3,
    ),
  ];

  Future<void> getUserInfo({ProfileInfo? info}) async {
    if (info != null) {
      userInfo.value = info.userInfo;
      roleType.value = info.role?.type;
      items.assignAll(
        roleType.value == UserRoleType.moderator ? _moderatorItems : _userItems,
      );
      return;
    }
    roleType.value = await MyPreferenceManger.instance.userRoleType;
    userInfo.value = await MyPreferenceManger.instance.getSavedUser();
    items.assignAll(
      roleType.value == UserRoleType.moderator ? _moderatorItems : _userItems,
    );
  }

  void updateIndex(int index) {
    if (index < items.length + 1) {
      final itemIndex =
          items.indexWhere((element) => element.navigationIndex == index);
      currentIndex = itemIndex >= 0 ? itemIndex : index;
    } else if (index < 0) {
      currentIndex = 0;
    }
  }

  void handleItemChanged({
    required int index,
    required StatefulNavigationShell navigationShell,
  }) {
    int updatedIndex;
    if (index < items.length + 1) {
      updatedIndex = items[index].navigationIndex ?? index;
    } else {
      updatedIndex = index;
    }
    PlayxNavigation.goToBranch(
      index: updatedIndex,
      navigationShell: navigationShell,
      initialLocation: true,
    );
  }
}
