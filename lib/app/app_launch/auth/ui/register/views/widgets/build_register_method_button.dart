part of '../../imports/register_imports.dart';

class BuildRegisterMethodButton extends GetView<RegisterController> {
  final LoginMethod method;

  const BuildRegisterMethodButton({
    required this.method,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.r,
      ),
      child: CustomElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0.r, vertical: 4.r),
              child: CustomText(
                method.loginLabel,
                color: method.onBackground(context),
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (method.icon != null)
              Padding(
                padding: EdgeInsetsDirectional.only(start: 20.0.r),
                child: method.icon!.buildIconWidget(
                  size: 24.r,
                ),
              ),
          ],
        ),
        onPressed: () {
          controller.registerBy(method: method);
        },
      ),
    );
  }
}
