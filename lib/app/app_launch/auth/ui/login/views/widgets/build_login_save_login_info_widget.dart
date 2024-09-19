part of '../../imports/login_imports.dart';

class BuildLoginSaveLoginInfoWidget extends GetView<LoginController> {
  const BuildLoginSaveLoginInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.r,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Obx(() {
            return Checkbox(
              value: controller.saveLoginInfo.value,
              onChanged: (value) {
                controller.saveLoginInfo.value = value ?? false;
              },
              activeColor: context.colors.onSurface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            );
          }),
          CustomText(
            AppTrans.saveLoginInfo,
            fontSize: 15.sp,
            color: context.colors.onSurface,
            fontWeight: FontWeight.w400,
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
