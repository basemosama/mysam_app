part of '../../imports/register_imports.dart';

class BuildRegisterLottieAnimation extends StatelessWidget {
  const BuildRegisterLottieAnimation();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0.r),
      child: CircleAvatar(
        radius: context.height * .07,
        backgroundColor: context.colors.surface,
        child: ImageViewer.svgAsset(
          Assets.images.logoBasedOnTheme,
          width: context.height * .15,
          height: context.height * .15,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
