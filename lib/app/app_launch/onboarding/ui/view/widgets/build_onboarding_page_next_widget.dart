part of '../../imports/onboarding_imports.dart';

class BuildOnboardingPageNextWidget extends GetView<OnBoardingController> {
  const BuildOnboardingPageNextWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 24.r),
      child: ElevatedButton(
        onPressed: controller.handleNextOrSkip,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(16.r),
          backgroundColor: context.colors.primary, // <-- Button color
        ),
        child: Obx(() {
          return Icon(
            controller.isCompleted.value ? Icons.done : Icons.arrow_forward_ios,
            color: context.colors.onPrimary,
          );
        }),
      ),
    );
  }
}
