part of '../../../imports/create_contribution_imports.dart';

class BuildContributionMainFormRelatedWordWeightWidget extends StatelessWidget {
  final CreateContributionController controller;

  const BuildContributionMainFormRelatedWordWeightWidget(
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BuildContributionFieldWidget(
      label: AppTrans.keywordWeightLabel,
      child: CustomTextField(
        controller: controller.relatedWordWeightController,
        hint: AppTrans.keywordWeightHint,
        validator: qValidator([
          IsRequired(
            AppTrans.keywordWeightRequiredError.tr(context: context),
          ),
          ContainsLettersRule(
            word: controller.root.value,
            error: AppTrans.shouldContainRootLettersError.tr(context: context),
          ),
        ]),
        shouldAutoValidate: true,
        onValidationChanged: (isValid) {
          controller.isRelatedWordWeightValid.value = isValid;
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
        focus: controller.relatedWordWeightFocusNode,
        nextFocus: controller.relatedWordPropertiesFocusNode,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
