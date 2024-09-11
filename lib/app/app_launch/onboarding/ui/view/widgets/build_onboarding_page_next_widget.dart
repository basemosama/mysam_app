part of '../../imports/onboarding_imports.dart';

class BuildOnboardingPageNextWidget extends GetView<OnBoardingController> {
  const BuildOnboardingPageNextWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
      child: Obx(() {
        return FloatingActionButton(
          heroTag: 'next',
          onPressed: controller.handleNextOrSkip,
          child: Icon(
            controller.isCompleted.value ? Icons.done : Icons.arrow_forward_ios,
            color: context.colors.onPrimary,
          ),
        );
      }),
    );
  }
}
