part of '../../imports/login_imports.dart';

class BuildLoginSubtitleWidget extends StatelessWidget {
  const BuildLoginSubtitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.r,
        horizontal: 4.r,
      ),
      width: double.infinity,
      child: const CustomText(
        AppTrans.loginSubtitle,
        style: CustomTextStyle.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
