part of '../../../imports/edit_contribution_imports.dart';

class BuildContributionMainFormRelatedWordWidget extends StatelessWidget {
  final EditContributionController controller;

  const BuildContributionMainFormRelatedWordWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.keywordLabel,
      endLabelWidget: Tooltip(
        message: AppTrans.keywordTooltip.tr(context: context),
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
        margin: EdgeInsets.symmetric(horizontal: 8.r),
        triggerMode: TooltipTriggerMode.tap,
        child: Icon(
          Icons.info,
          color: context.colors.onSurface,
        ),
      ),
      child: CustomTextField(
        controller: controller.relatedWordController,
        hint: AppTrans.keywordHint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        validator: qValidator([
          IsRequired(
            AppTrans.keywordRequiredError.tr(context: context),
          ),
          ContainsLettersRule(
            word: controller.root.value,
            error: AppTrans.shouldContainRootLettersError.tr(context: context),
          ),
        ]),
        shouldAutoValidate: true,
        onValidationChanged: (isValid) {
          controller.isRelatedWordValid.value = isValid;
        },
        focus: controller.relatedWordFocusNode,
        nextFocus: controller.relatedWordWeightFocusNode,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
