part of '../../imports/register_imports.dart';

class BuildRegisterWithEmailWidget extends StatelessWidget {
  const BuildRegisterWithEmailWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BuildRegisterTitleWidget(),
          const BuildRegisterNameFieldWidget(),
          const BuildRegisterEmailFieldWidget(),
          const BuildRegisterPasswordFieldWidget(),
          const BuildRegisterConfirmPasswordWidget(),
          const BuildRegisterTermsWidget(),
          const BuildRegisterButtonWidget(),
        ],
      ),
    );
  }
}
