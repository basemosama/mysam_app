part of '../../imports/register_imports.dart';

class BuildRegisterPasswordFieldWidget extends GetView<RegisterController> {
  const BuildRegisterPasswordFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 5.h,
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
              suffix: IconButton(
                icon: Icon(
                  controller.hidePassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: controller.changeHidePasswordState,
                // color: context.colors.secondary,
              ),
              validator: qValidator([
                IsRequired(
                  AppTrans.passwordRequired.tr(context: context),
                ),
                MinLength(
                  6,
                  AppTrans.passwordMinLengthError.tr(context: context),
                ),
              ]),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.r,
                vertical: 14.r,
              ),
              prefix: Icon(
                Icons.lock,
                color: context.colors.primary,
              ),
              onChanged: (text) {
                if (controller
                    .confirmPasswordController.value.text.isNotEmpty) {
                  AppUtils.validate(
                    controller.confirmPasswordFormKey,
                    controller.isConfirmPasswordValid,
                  );
                }
              },
              shouldAutoValidate: true,
              onValidationChanged: (isValid) {
                controller.isPasswordValid.value = isValid;
              },
              textInputAction: TextInputAction.next,
              focus: controller.passwordFocus,
              nextFocus: controller.confirmPasswordFocus,
            ),
          ],
        ),
      );
    });
  }
}
