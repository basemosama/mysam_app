part of '../../../imports/onboarding_imports.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoarding onboarding;

  const OnBoardingPage({required this.onboarding});

  @override
  Widget build(BuildContext context) {
    return OptimizedScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BuildOnboardingPageIllustration(onBoarding: onboarding),
          SizedBox(
            height: 24.r,
          ),
          const BuildOnboardingPageIndicatorsWidget(),
          BuildOnboardingPageTitle(onBoarding: onboarding),
          BuildOnboardingPageSubtitle(onBoarding: onboarding),
        ],
      ),
    );
  }
}
