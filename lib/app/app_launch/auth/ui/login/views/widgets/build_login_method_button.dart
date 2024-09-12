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
        vertical: 6.r,
      ),
      child: CustomIconButton(
        iconInfo: method.icon,
        width: context.width * 0.08,
        height: context.width * 0.08,
        backgroundColor: context.colors.surface,
        borderSide: BorderSide(
          color: context.colors.primary,
          width: 1.r,
        ),
        onPressed: () {},
      ),
    );
  }
}
