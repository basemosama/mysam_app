part of '../../imports/login_imports.dart';

class BuildLoginSubtitleWidget extends StatelessWidget {
  const BuildLoginSubtitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.r,
        horizontal: 8.r,
      ),
      width: double.infinity,
      child: CustomText(
        AppTrans.loginSubtitle,
        fontSize: 18.sp,
        color: context.colors.subtitleTextColor,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
    );
  }
}
