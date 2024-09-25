part of '../../../../../../../imports/edit_contribution_imports.dart';

class BuildIdiomContributionDescriptionFieldWidget
    extends GetView<EditIdiomContributionController> {
  const BuildIdiomContributionDescriptionFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.idiomContributionDescriptionLabel,
      child: CustomTextField(
        controller: controller.descriptionController,
        hint: AppTrans.idiomContributionHintLabel,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        validator: qValidator([
          IsRequired(
            AppTrans.idiomContributionDescriptionRequiredError
                .tr(context: context),
          ),
          Contains(
            controller.relatedWordController.text,
            AppTrans.shouldContainsKeywordError.tr(context: context),
          ),
        ]),
        shouldAutoValidate: true,
        onValidationChanged: (isValid) {
          controller.isDescriptionValid.value = isValid;
        },
        focus: controller.descriptionFocusNode,
        minLines: 4,
        maxLines: 8,
      ),
    );
  }
}
