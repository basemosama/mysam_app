part of '../../imports/register_imports.dart';

class BuildRegisterConfirmPasswordWidget extends GetView<RegisterController> {
  const BuildRegisterConfirmPasswordWidget();

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
                AppTrans.confirmPasswordLabel,
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 4.r),
            CustomTextField(
              hint: AppTrans.confirmPasswordHint,
              controller: controller.confirmPasswordController,
              obscureText: controller.hideConfirmPassword.value,
              type: TextInputType.visiblePassword,
              suffix: IconButton(
                icon: Icon(
                  controller.hideConfirmPassword.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: controller.changeHideConfirmPasswordState,
                // color: context.colors.secondary,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.r,
                vertical: 14.r,
              ),
              validator: qValidator([
                IsRequired(
                  AppTrans.passwordRequired.tr(context: context),
                ),
                AreEqual(
                  other: () => controller.passwordController.value.text,
                  errorMsg:
                      AppTrans.confirmPasswordMatchError.tr(context: context),
                ),
              ]),
              prefix: const Icon(
                Icons.lock,
                // color: context.colors.secondary,
              ),
              shouldAutoValidate: true,
              onValidationChanged: (isValid) {
                controller.isConfirmPasswordValid.value = isValid;
              },
              focus: controller.confirmPasswordFocus,
            ),
          ],
        ),
      );
    });
  }
}
