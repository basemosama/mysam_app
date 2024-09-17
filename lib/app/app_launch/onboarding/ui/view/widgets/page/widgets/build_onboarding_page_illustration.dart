part of '../../../../imports/onboarding_imports.dart';

class BuildOnboardingPageIllustration extends StatelessWidget {
  final OnBoarding onBoarding;

  const BuildOnboardingPageIllustration({required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    Widget? animationChild;
    Widget? imageChild;
    final Widget child;

    if (onBoarding.hasLottie) {
      animationChild = Lottie.asset(
        onBoarding.lottieAsset!,
        errorBuilder: (ctx, e, _) => const SizedBox.shrink(),
      );
    } else if (onBoarding.hasSvgImage) {
      imageChild = ImageViewer.svgAsset(
        onBoarding.svgImageAsset!,
        width: context.width * .8,
        height: context.height * .4,
      );
    } else if (onBoarding.hasImageAsset) {
      imageChild = ImageViewer.asset(
        onBoarding.imageAsset!,
        width: context.width * .85,
        height: context.height * .4,
        fit: BoxFit.contain,
        errorBuilder: (
          ctx,
          _,
        ) =>
            const SizedBox.shrink(),
      );
    } else if (onBoarding.hasImageUrl) {
      imageChild = ImageViewer.cachedNetwork(
        onBoarding.imageUrlAsset!,
        width: context.width * .8,
        height: context.height * .4,
        errorBuilder: (
          ctx,
          _,
        ) =>
            const SizedBox.shrink(),
      );
    }

    if (animationChild != null) {
      child = animationChild;
    } else if (imageChild != null) {
      child = Container(
        padding: EdgeInsets.all(3.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: context.colors.primary,
          )
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: imageChild,
        ),
      );
    } else {
      child = const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.only(right: 8.r, left: 8.r, top: 4.r),
      child: child,
    );
  }
}
