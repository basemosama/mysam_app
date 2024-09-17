part of '../../../../../imports/create_contribution_imports.dart';

class CreateModernMeaningContributionController
    extends CreateContributionController {
  CreateModernMeaningContributionController({
    required super.root,
  }) : super(
          contributionType: ContributionType.modernMeaning,
        );

  final wordsController = TextEditingController();
  final RxList<String> words = <String>[].obs;

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
    _secondStepValidationWorker = everAll([words], (_) {
      isSecondStepValid.value = words.isNotEmpty;
    });
  }

  void addWord() {
    final text = wordsController.text.trim();
    if (text.isEmpty) return;
    if (words.contains(text)) {
      wordsController.clear();
      return;
    }

    words.add(text);
    wordsController.clear();
  }

  @override
  Contribution createContributionModel() {
    return ModernMeaningContribution(
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
      modernMeanings: words.toList(),
    );
  }
}
