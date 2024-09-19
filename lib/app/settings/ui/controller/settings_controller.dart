part of '../imports/settings_imports.dart';

enum SettingsPage {
  settings,
  language,
  theme;
}

class SettingsController extends GetxController {
  Rxn<XLocale> currentLocale = Rxn(PlayxLocalization.currentXLocale);
  Rx<XTheme> currentTheme = Rx(PlayxTheme.currentTheme);

  List<XLocale> get supportedLocales => PlayxLocalization.supportedXLocales;

  final currentPage = ValueNotifier(SettingsPage.settings.index);

  CustomNavigationDrawerController get drawerController =>
      Get.find<CustomNavigationDrawerController>();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void handleLanguageSelection(XLocale locale) {
    currentLocale.value = locale;
    PlayxLocalization.updateTo(locale);
    PlayxNavigation.pop();
  }

  Future<void> handleThemeSelection(
    XTheme theme, {
    BuildContext? context,
  }) async {
    final bottomNavController = Get.find<CustomBottomNavigationController>();
    bottomNavController.showBottomNav.value = false;
    PlayxNavigation.pop();
    await Future.delayed(const Duration(milliseconds: 300));
    await PlayxTheme.updateTo(
      theme,
      animation: PlayxThemeAnimation.clipper(),
    );
    currentTheme.value = theme;
    bottomNavController.showBottomNav.value = true;
  }

  Future<void> handleLogOutTap() async {
    drawerController.updateLoginStatus(isLoggingOut: true);
    try {
      await ApiHelper.instance.logout();
    } catch (e) {
      Alert.error(message: e.toString());
    }
    await Future.delayed(const Duration(milliseconds: 200));
    AppNavigation.navigateToSplash();
    drawerController.updateLoginStatus(isLoggingOut: false);
  }

  Future<void> showSettingsModalSheet(
    BuildContext context,
  ) async {
    final List<SliverWoltModalSheetPage> settingsPages = [
      SettingsView.buildSettingsModalSheetPage(this, context),
      BuildSettingsLanguageWidget.buildModalPage(
        controller: this,
        context: context,
        isOnlyPage: false,
      ),
      BuildSettingsThemeWidget.buildModalPage(
        controller: this,
        context: context,
        isOnlyPage: false,
      ),
    ];

    return CustomModal.showModal(
      context: context,
      pageListBuilder: (context) => settingsPages,
      onModalDismissedWithBarrierTap: closeSettingsModalSheet,
      pageIndexNotifier: currentPage,
    );
  }

  Future<void> showSettingsModalPageSheet(
    BuildContext context,
    SliverWoltModalSheetPage page,
  ) async {
    return CustomModal.showPageModal(
      context: context,
      pageBuilder: (context) => page,
      onModalDismissedWithBarrierTap: closeSettingsModalSheet,
    );
  }

  void closeSettingsModalSheet() {
    PlayxNavigation.pop();
    currentPage.value = SettingsPage.settings.index;
  }
}
