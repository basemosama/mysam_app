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
        vertical: 6.r,
      ),
      child: CustomIconButton(
        iconInfo: method.icon,
        width: context.width * 0.075,
        height: context.width * 0.075,
        backgroundColor: context.colors.surface,
        borderSide: BorderSide(
          color: context.colors.primary,
          width: 1.r,
        ),
        onPressed: () {
          controller.registerBy(method: method);
        },
      ),
    );
  }
}
