part of '../../imports/login_imports.dart';

class BuildLoginRegisterNowWidget extends GetView<LoginController> {
  const BuildLoginRegisterNowWidget();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.navigateToRegister,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.r,
        ),
        child: RichText(
          text: TextSpan(
            text: AppTrans.dontHaveAccountText.tr(context: context),
            style: TextStyle(
              color: context.colors.subtitleTextColor,
              fontSize: 16.sp,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: AppTrans.registerNow.tr(context: context),
                style: TextStyle(
                  color: context.colors.onSurface,
                  fontSize: 16.sp,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
