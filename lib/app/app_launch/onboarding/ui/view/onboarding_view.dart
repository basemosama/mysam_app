part of '../imports/onboarding_imports.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 8.r),
              alignment: AlignmentDirectional.centerEnd,
              child: const BuildOnboardingPageSkipWidget(),
            ),
            const Expanded(
              child: BuildOnboardingPageViewWidget(),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              alignment: AlignmentDirectional.centerEnd,
              child: const BuildOnboardingPageNextWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
