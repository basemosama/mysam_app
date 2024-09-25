part of '../../imports/login_imports.dart';

class BuildLoginTitleWidget extends GetView<LoginController> {
  const BuildLoginTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.r,
        horizontal: 4.r,
      ),
      width: double.infinity,
      child: CustomText(
        AppTrans.loginTitle,
        fontSize: 22.sp,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
