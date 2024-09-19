part of '../../../imports/edit_contribution_imports.dart';

class BuildContributionMainFormRootWidget extends StatelessWidget {
  final EditContributionController controller;

  const BuildContributionMainFormRootWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.rootWordLabel,
      child: CustomTextField(
        controller: controller.rootWordController,
        hint: AppTrans.rootWordHint,
        enabled: false,
        fillColor: context.colors.filledColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      ),
    );
  }
}
