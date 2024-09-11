part of '../../imports/register_imports.dart';

class BuildRegisterSubtitleWidget extends StatelessWidget {
  const BuildRegisterSubtitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.r,
        horizontal: 4.r,
      ),
      width: double.infinity,
      child: const CustomText(
        AppTrans.registerSubtitle,
        style: CustomTextStyle.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
