part of '../../imports/login_imports.dart';

class BuildChooseLoginMethodWidget extends GetView<LoginController> {
  const BuildChooseLoginMethodWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BuildLoginTitleWidget(),
        SizedBox(height: 14.r),
        ...List.generate(
          controller.loginMethods.length,
          (i) => BuildLoginMethodButton(
            method: controller.loginMethods[i],
          ),
        ),
      ],
    );
  }
}
