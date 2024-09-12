part of '../../imports/register_imports.dart';

class BuildChooseRegisterMethodWidget extends GetView<RegisterController> {
  const BuildChooseRegisterMethodWidget();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      children: List.generate(
        controller.loginMethods.length,
        (i) => BuildRegisterMethodButton(
          method: controller.loginMethods[i],
        ),
      ),
    );
  }
}
