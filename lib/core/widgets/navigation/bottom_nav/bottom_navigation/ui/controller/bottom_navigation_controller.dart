part of '../imports/bottom_navigation_imports.dart';

class CustomBottomNavigationController extends GetxController {
  int currentIndex = 0;
  final userInfo = Rxn<UserInfo>();
  final showBottomNav = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo({ProfileInfo? info}) async {
    if (info != null) {
      userInfo.value = info.userInfo;
      return;
    }
    final res = await ProfileRepository().getProfileInfo();
    res.when(
      success: (info) async {
        userInfo.value = info.userInfo;
      },
      error: (error) {
        userInfo.value = null;
      },
    );
  }

  void updateIndex(int index) {
    if (index < 4) {
      currentIndex = index;
    } else if (index < 0) {
      currentIndex = 0;
    }
  }

  void handleItemChanged({
    required int index,
    required StatefulNavigationShell navigationShell,
  }) {
    PlayxNavigation.goToBranch(index: index, navigationShell: navigationShell);
  }
}
