part of '../../../../imports/onboarding_imports.dart';

class BuildOnboardingPageTitle extends StatelessWidget {
  final OnBoarding onBoarding;

  const BuildOnboardingPageTitle({required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0.r, horizontal: 4.r),
      width: double.infinity,
      child: CustomText(
        onBoarding.title,
        style: CustomTextStyle.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
