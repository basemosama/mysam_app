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

  @override
  bool get isNextOrFinishButtonEnabled {
    switch (currentStepIndex.value) {
      case 0:
        return isMainFormValid.value;
      default:
        return isSecondStepValid.value;
    }
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
      type: ContributionType.qa,
      root: root,
      question: questionController.text,
      answer: answerController.text,
    );
  }
}
