part of '../../imports/login_imports.dart';

class BuildLoginButtonWidget extends GetView<LoginController> {
  const BuildLoginButtonWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        onPressed: controller.isFormValid.value ? controller.login : null,
        child: CustomText(
          AppTrans.loginText,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: controller.isFormValid.value
              ? context.colors.onPrimary
              : context.colors.subtitleTextColor,
        ),
      );
    });
  }
}
