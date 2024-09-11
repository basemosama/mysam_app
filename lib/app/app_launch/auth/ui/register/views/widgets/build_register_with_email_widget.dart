part of '../../imports/register_imports.dart';

class BuildRegisterWithEmailWidget extends StatelessWidget {
  const BuildRegisterWithEmailWidget();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BuildRegisterEmailFieldWidget(),
        BuildRegisterPasswordFieldWidget(),
        BuildRegisterConfirmPasswordWidget(),
        BuildRegisterButtonWidget(),
      ],
    );
  }
}
