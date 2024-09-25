part of '../../../../../imports/edit_contribution_imports.dart';

class EditSlangContributionController extends EditContributionController {
  EditSlangContributionController({
    required super.contribution,
    required super.root,
  });

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
    words.addAll((contribution as SlangContribution).slangWords);
    isSecondStepValid.value = true;
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
    return SlangContribution(
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
      slangWords: words.toList(),
    );
  }
}
