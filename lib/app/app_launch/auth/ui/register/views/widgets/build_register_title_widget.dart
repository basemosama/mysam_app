part of '../../imports/register_imports.dart';

class BuildRegisterTitleWidget extends StatelessWidget {
  const BuildRegisterTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 8.r,
        left: 8.r,
        bottom: 8.r,
      ),
      width: double.infinity,
      child: CustomText(
        AppTrans.registerTitle,
        style: CustomTextStyle.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
