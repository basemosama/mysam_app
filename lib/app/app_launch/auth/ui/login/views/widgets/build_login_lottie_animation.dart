part of '../../imports/login_imports.dart';

class BuildLoginLottieAnimation extends StatelessWidget {
  const BuildLoginLottieAnimation();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0.r),
      child: CircleAvatar(
        radius: context.height * .08,
        backgroundColor: context.colors.surface,
        child: ImageViewer.svgAsset(
          Assets.images.logoBasedOnTheme,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
