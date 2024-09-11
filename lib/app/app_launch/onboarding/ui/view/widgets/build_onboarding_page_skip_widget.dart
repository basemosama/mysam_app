part of '../../imports/onboarding_imports.dart';

class BuildOnboardingPageSkipWidget extends GetView<OnBoardingController> {
  const BuildOnboardingPageSkipWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 24.r),
      child: Obx(() {
        return AnimatedOpacity(
          opacity: controller.isCompleted.value ? 0.0 : 1.0,
          duration: 250.milliseconds,
          child: TextButton(
            onPressed: controller.handleSkip,
            child: CustomText(
              AppTrans.skip,
              color: context.colors.onSurface,
            ),
          ),
        );
      }),
    );
  }
}
