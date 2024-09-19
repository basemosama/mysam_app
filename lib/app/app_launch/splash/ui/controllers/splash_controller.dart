part of '../imports/splash_imports.dart';

class SplashController extends FullLifeCycleController with FullLifeCycleMixin {
  final isBiometricAuthEnabled = false;
  final Completer<bool> shouldUpdateApp = Completer();
  final Completer<bool> isAnimationCompleted = Completer();
  final Completer<bool> isProfileLoaded = Completer();
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    // handleAppUpdate();
    super.onInit();
    checkAppVersionAndNavigateToNextPage();
  }

  Future<void> checkAppVersionAndNavigateToNextPage({
    bool shouldCheckVersion = true,
  }) async {
    // if (shouldCheckVersion) {
    //   final doesAppNeedUpdate = await shouldUpdateApp.future;
    //   if (doesAppNeedUpdate) return;
    // }

    final isLoggedIn = await ApiHelper.instance.isLoggedIn();
    if (isLoggedIn) {
      _getProfileInfo();
    }

    await isAnimationCompleted.future;

    final isOnBoardingNotShown =
        !(await MyPreferenceManger.instance.isOnBoardingShown);
    if (isOnBoardingNotShown) {
      AppNavigation.navigateFromSplashToOnBoarding();
      return;
    }

    final isLoggedOut = await ApiHelper.instance.isLoggedOut();
    if (isLoggedOut) {
      AppNavigation.navigateFormSplashToLogin();
      return;
    }
    isLoading.value = true;

    await isProfileLoaded.future;
    isLoading.value = false;
    AppNavigation.navigateFormSplashToHome();
  }

  Future<void> _getProfileInfo() async {
    final res = await ProfileRepository().getProfileInfo(saveUserInfo: true);
    res.when(
        success: (profileInfo) {
          if (Get.isRegistered<CustomBottomNavigationController>()) {
            Get.find<CustomBottomNavigationController>()
                .getUserInfo(info: profileInfo);
          }
        },
        error: (error) {});
    isProfileLoaded.complete(true);
  }

  // Future<void> handleAppUpdate() async {
  //   final result = await PlayxVersionUpdate.showUpdateDialog(
  //     context: Get.context!,
  //     forceUpdate: false,
  //     googlePlayId: Constants.playStoreId,
  //     country: Constants.storeCountry,
  //     language: Constants.storeLanguage,
  //     onCancel: (info) {
  //       if (info.forceUpdate) {
  //         exit(0);
  //       } else {
  //         checkAppVersionAndNavigateToNextPage(shouldCheckVersion: false);
  //       }
  //     },
  //     onUpdate: (info, mode) {
  //       PlayxVersionUpdate.openStore(
  //         storeUrl: Constants.storeUrl,
  //         launchMode: mode,
  //       );
  //       checkAppVersionAndNavigateToNextPage(shouldCheckVersion: false);
  //     },
  //     title: (info) => AppTrans.updateTitle.tr(),
  //     description: (info) => AppTrans.updateDescription.tr(),
  //     releaseNotesTitle: (info) => AppTrans.updateReleaseNotesTitle.tr(),
  //     updateActionTitle: AppTrans.updateConfirmActionTitle.tr(),
  //     dismissActionTitle: AppTrans.updateDismissActionTitle.tr(),
  //   );
  //   result.when(
  //     success: (canUpdate) {
  //       shouldUpdateApp.complete(canUpdate);
  //     },
  //     error: (error) {
  //       shouldUpdateApp.complete(false);
  //     },
  //   );
  // }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    // checkAppVersionAndNavigateToNextPage();
  }

  @override
  void onHidden() {}

  void handleAnimationCompleted(AnimationController controller) {
    isAnimationCompleted.complete(true);
  }
}
