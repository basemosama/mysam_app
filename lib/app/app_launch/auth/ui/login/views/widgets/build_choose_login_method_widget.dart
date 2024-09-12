part of '../../imports/login_imports.dart';

class BuildChooseLoginMethodWidget extends GetView<LoginController> {
  const BuildChooseLoginMethodWidget();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      children: List.generate(
        controller.loginMethods.length,
        (i) => BuildLoginMethodButton(
          method: controller.loginMethods[i],
        ),
      ),
    );
  }
}
