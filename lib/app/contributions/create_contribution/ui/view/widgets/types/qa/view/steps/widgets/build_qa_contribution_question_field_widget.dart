part of '../../../../../../../imports/create_contribution_imports.dart';

class BuildQaContributionQuestionFieldWidget
    extends GetView<CreateQaContributionController> {
  const BuildQaContributionQuestionFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.questionLabel,
      child: CustomTextField(
        controller: controller.questionController,
        hint: AppTrans.questionHint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        validator: qValidator([
          IsRequired(
            AppTrans.questionRequiredError.tr(context: context),
          ),
          Contains(
            controller.relatedWordController.text,
            AppTrans.shouldContainsKeywordError.tr(context: context),
          ),
        ]),
        shouldAutoValidate: true,
        onValidationChanged: (isValid) {
          controller.isQuestionValid.value = isValid;
        },
        focus: controller.questionFocusNode,
        nextFocus: controller.answerFocusNode,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
