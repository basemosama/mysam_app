part of '../../imports/login_imports.dart';

class BuildLoginPasswordFieldWidget extends GetView<LoginController> {
  const BuildLoginPasswordFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.r,
          vertical: 5.r,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.r),
              child: CustomText(
                AppTrans.passwordLabel,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.r),
            CustomTextField(
              hint: AppTrans.passwordHint,
              controller: controller.passwordController,
              obscureText: controller.hidePassword.value,
              type: TextInputType.visiblePassword,
              suffix: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: IconButton(
                  icon: Icon(
                    controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 20.r,
                  ),
                  onPressed: () {
                    controller.hidePassword.value =
                        !controller.hidePassword.value;
                  },
                  // color: context.colors.secondary,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.r,
                vertical: 14.r,
              ),
              validator: qValidator([
                IsRequired(
                  AppTrans.passwordRequired.tr(context: context),
                ),
                MinLength(
                    6, AppTrans.passwordMinLengthError.tr(context: context)),
              ]),
              prefix: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Icon(
                  Icons.lock,
                  // color: context.colors.secondary,
                  size: 20.r,
                ),
              ),
              shouldAutoValidate: true,
              onValidationChanged: (isValid) {
                controller.isPasswordValid.value = isValid;
              },
            ),
          ],
        ),
      );
    });
  }
}
