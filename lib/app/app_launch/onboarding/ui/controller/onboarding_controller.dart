part of '../imports/onboarding_imports.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();

  final currentIndex = 0.obs;
  final isCompleted = false.obs;

  final pages = <OnBoarding>[
    OnBoarding.imageAsset(
      title: AppTrans.secondBoardingTitle,
      subtitle: AppTrans.secondBoardingSubTitle,
      imageAsset: Assets.images.arabicOnboarding2,
      // lottieAsset: Assets.animations.secondBoardingAnimation,
    ),
    OnBoarding.imageAsset(
      title: AppTrans.firstBoardingTitle,
      subtitle: AppTrans.firstBoardingSubTitle,
      imageAsset: Assets.images.arabicOnboarding1,
      // lottieAsset: Assets.animations.firstBoardingAnimation,
    ),
    OnBoarding.imageAsset(
      title: AppTrans.thirdBoardingTitle,
      subtitle: AppTrans.thirdBoardingSubTitle,
      imageAsset: Assets.images.communityOnboarding,
      // lottieAsset: Assets.animations.thirdBoardingAnimation,
    ),
  ];

  Future<void> handleNextOrSkip() async {
    if (isCompleted.value) {
      handleSkip();
    } else {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int value) {
    currentIndex.value = value;
    isCompleted.value = value == pages.length - 1;
  }

  void handleSkip() {
    MyPreferenceManger.instance.saveOnBoardingShown();
    AppNavigation.navigateFromOnBoardingToLogin();
  }
}
