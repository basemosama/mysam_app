part of '../../imports/login_imports.dart';

class BuildLoginMethodButton extends GetView<LoginController> {
  final LoginMethod method;
  const BuildLoginMethodButton({
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
          controller.loginBy(method: method);
        },
      ),
    );
  }
}
