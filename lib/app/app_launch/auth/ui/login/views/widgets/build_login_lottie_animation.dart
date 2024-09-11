part of '../../imports/login_imports.dart';

class BuildLoginLottieAnimation extends StatelessWidget {
  const BuildLoginLottieAnimation();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0.r),
      child: CircleAvatar(
        radius: context.height * .075,
        backgroundColor: context.colors.surface,
        child: ImageViewer.svgAsset(
          Assets.images.logo,
          width: context.height * .15,
          height: context.height * .15,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
