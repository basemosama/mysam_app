part of '../../imports/login_imports.dart';

class BuildLoginWithEmailWidget extends StatelessWidget {
  const BuildLoginWithEmailWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BuildLoginSubtitleWidget(),
          SizedBox(height: 14.r),
          const BuildLoginEmailFieldWidget(),
          const BuildLoginPasswordFieldWidget(),
          const BuildLoginSaveLoginInfoWidget(),
          const BuildLoginButtonWidget(),
        ],
      ),
    );
  }
}
