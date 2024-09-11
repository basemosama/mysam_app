part of '../../imports/register_imports.dart';

class BuildChooseRegisterMethodWidget extends GetView<RegisterController> {
  const BuildChooseRegisterMethodWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          controller.loginMethods.length,
          (i) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.r),
            child: BuildRegisterMethodButton(
              method: controller.loginMethods[i],
            ),
          ),
        ),
        SizedBox(height: 4.r),
        // const BuildRegisterRegisterNowWidget(),
      ],
    );
  }
}
