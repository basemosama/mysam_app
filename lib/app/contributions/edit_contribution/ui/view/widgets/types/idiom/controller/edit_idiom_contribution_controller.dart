part of '../../../../../imports/edit_contribution_imports.dart';

class EditIdiomContributionController extends EditContributionController {
  EditIdiomContributionController({
    required super.contribution,
    required super.root,
  });

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
  void setupFields() {
    _setupMainForum();
    _setupSecondStep();
  }

  @override
  void onInit() {
    super.onInit();
    _validateSecondStep();
  }

  void _setupSecondStep() {
    bodyController.text = (contribution as IdiomContribution).body;
    descriptionController.text =
        (contribution as IdiomContribution).description ?? '';
    isBodyValid.value = true;
    isDescriptionValid.value = true;
    isSecondStepValid.value = true;
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
    return IdiomContribution(
      id: contribution.id,
      documentId: contribution.documentId,
      status: contribution.status,
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
