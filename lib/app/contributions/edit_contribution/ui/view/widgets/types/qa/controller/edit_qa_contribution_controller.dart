part of '../../../../../imports/edit_contribution_imports.dart';

class EditQaContributionController extends EditContributionController {
  EditQaContributionController({
    required super.contribution,
    required super.root,
  });

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
    questionController.text = (contribution as QAContribution).question;
    answerController.text = (contribution as QAContribution).answer;
    isQuestionValid.value = true;
    isAnswerValid.value = true;
    isSecondStepValid.value = true;
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
      question: questionController.text,
      answer: answerController.text,
    );
  }
}
