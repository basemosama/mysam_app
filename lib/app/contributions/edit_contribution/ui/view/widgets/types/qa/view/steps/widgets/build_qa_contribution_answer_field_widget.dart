part of '../../../../../../../imports/edit_contribution_imports.dart';

class BuildQaContributionAnswerFieldWidget
    extends GetView<EditQaContributionController> {
  const BuildQaContributionAnswerFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.answerLabel,
      child: CustomTextField(
        controller: controller.answerController,
        hint: AppTrans.answerHint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        validator: qValidator([
          IsRequired(
            AppTrans.answerRequiredError.tr(context: context),
          ),
          Contains(
            controller.relatedWordController.text,
            AppTrans.shouldContainsKeywordError.tr(context: context),
          ),
        ]),
        shouldAutoValidate: true,
        onValidationChanged: (isValid) {
          controller.isAnswerValid.value = isValid;
        },
        focus: controller.answerFocusNode,
        minLines: 4,
        maxLines: 7,
      ),
    );
  }
}
