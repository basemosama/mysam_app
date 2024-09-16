part of '../../../../../imports/create_contribution_imports.dart';

class CreatePoemContributionController extends CreateContributionController {
  CreatePoemContributionController({
    required super.root,
  }) : super(
          contributionType: ContributionType.poem,
        );

  final bodyController = TextEditingController();
  final descriptionController = TextEditingController();

  final isBodyValid = false.obs;
  final isDescriptionValid = false.obs;

  final bodyFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();

  final isSecondStepValid = false.obs;

  Worker? _secondStepValidationWorker;

  @override
  bool get isNextOrFinishButtonEnabled {
    switch (currentStepIndex.value) {
      case 0:
        return isMainFormValid.value;
      case 1:
        return isSecondStepValid.value;
      default:
        return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _validateSecondStep();
  }

  void _validateSecondStep() {
    _secondStepValidationWorker?.dispose();
    _secondStepValidationWorker =
        everAll([isBodyValid, isDescriptionValid], (_) {
      isSecondStepValid.value = isBodyValid.value && isDescriptionValid.value;
    });
  }

  @override
  Contribution createContributionModel() {
    return PoemContribution(
      id: 0,
      documentId: '',
      status: ContributionStatus.pending,
      relatedWord: ContributionRelatedWord(
        word: relatedWordController.text,
        weight: relatedWordWeightController.text,
        type: relatedWordType.value,
        metadata: relatedWordProperties,
      ),
      root: root,
      body: bodyController.text,
      description: descriptionController.text,
    );
  }
}
