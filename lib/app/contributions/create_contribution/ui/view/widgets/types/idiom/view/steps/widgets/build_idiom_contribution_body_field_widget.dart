part of '../../../../../../../imports/create_contribution_imports.dart';

class BuildIdiomContributionBodyFieldWidget
    extends GetView<CreateIdiomContributionController> {
  const BuildIdiomContributionBodyFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.idiomContributionBodyLabel,
      child: CustomTextField(
        controller: controller.bodyController,
        hint: AppTrans.idiomContributionBodyHint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        validator: qValidator([
          IsRequired(
            AppTrans.idiomContributionBodyRequiredError.tr(context: context),
          ),
          Contains(
            controller.relatedWordController.text,
            AppTrans.shouldContainsKeywordError.tr(context: context),
          ),
        ]),
        shouldAutoValidate: true,
        onValidationChanged: (isValid) {
          controller.isBodyValid.value = isValid;
        },
        focus: controller.bodyFocusNode,
        nextFocus: controller.descriptionFocusNode,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
