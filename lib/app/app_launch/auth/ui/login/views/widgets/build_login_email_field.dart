part of '../../imports/login_imports.dart';

class BuildLoginEmailFieldWidget extends GetView<LoginController> {
  const BuildLoginEmailFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.r,
        vertical: 4.r,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0.r),
            child: CustomText(
              AppTrans.emailOrUsernameLabel,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 4.r),
          CustomTextField(
            hint: AppTrans.emailHint,
            controller: controller.emailController,
            type: TextInputType.emailAddress,
            validator: qValidator([
              IsRequired(AppTrans.emailRequired.tr(context: context)),
            ]),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.r,
              vertical: 14.r,
            ),
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Icon(
                Icons.email,
                color: context.colors.primary,
                size: 20.r,
              ),
            ),
            shouldAutoValidate: true,
            onValidationChanged: (isValid) {
              controller.isEmailValid.value = isValid;
            },
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
