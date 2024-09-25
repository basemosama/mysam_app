part of '../../../../../imports/create_contribution_imports.dart';

class CreateQaContributionController extends CreateContributionController {
  CreateQaContributionController({
    required super.root,
  }) : super(
          contributionType: ContributionType.qa,
        );

  final questionController = TextEditingController();
  final answerController = TextEditingController();

  final isQuestionValid = false.obs;
  final isAnswerValid = false.obs;

  final questionFocusNode = FocusNode();
  final answerFocusNode = FocusNode();

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
        everAll([isQuestionValid, isAnswerValid], (_) {
      isSecondStepValid.value = isQuestionValid.value && isAnswerValid.value;
    });
  }

  @override
  Contribution createContributionModel() {
    return QAContribution(
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
      question: questionController.text,
      answer: answerController.text,
    );
  }
}
