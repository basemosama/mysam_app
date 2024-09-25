part of '../../../../../../../imports/edit_contribution_imports.dart';

class BuildPoemContributionBodyFieldWidget
    extends GetView<EditPoemContributionController> {
  const BuildPoemContributionBodyFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.poemContributionBodyLabel,
      child: CustomTextField(
        controller: controller.bodyController,
        hint: AppTrans.poemContributionBodyHint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        validator: qValidator([
          IsRequired(
            AppTrans.poemContributionBodyRequiredError.tr(context: context),
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
