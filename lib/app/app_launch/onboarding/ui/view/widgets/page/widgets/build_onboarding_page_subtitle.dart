part of '../../../../imports/onboarding_imports.dart';

class BuildOnboardingPageSubtitle extends StatelessWidget {
  final OnBoarding onBoarding;

  const BuildOnboardingPageSubtitle({required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    final subtitle = onBoarding.subtitle;
    if (subtitle == null || subtitle.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(8.0.r),
      width: double.infinity,
      child: CustomText(
        onBoarding.subtitle!,
        textAlign: TextAlign.center,
      ),
    );
  }
}
