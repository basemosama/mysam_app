part of '../../imports/onboarding_imports.dart';

class BuildOnboardingPageNextWidget extends GetView<OnBoardingController> {
  const BuildOnboardingPageNextWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 24.r),
      child: CustomIconButton(
        onPressed: controller.handleNextOrSkip,
        padding: EdgeInsets.all(16.r),
        child: Obx(() {
          return Icon(
            controller.isCompleted.value ? Icons.done : Icons.arrow_forward_ios,
            color: context.colors.surface,
          );
        }),
      ),
    );
  }
}
