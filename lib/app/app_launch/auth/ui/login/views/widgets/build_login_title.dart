part of '../../imports/login_imports.dart';

class BuildLoginTitleWidget extends GetView<LoginController> {
  const BuildLoginTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 8.r,
        left: 8.r,
        bottom: 8.r,
      ),
      width: double.infinity,
      child: const CustomText(
        AppTrans.loginTitle,
        style: CustomTextStyle.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
