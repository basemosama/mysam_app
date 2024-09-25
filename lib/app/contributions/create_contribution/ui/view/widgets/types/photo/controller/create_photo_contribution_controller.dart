part of '../../../../../imports/create_contribution_imports.dart';

class CreatePhotoContributionController extends CreateContributionController {
  CreatePhotoContributionController({
    required super.root,
  }) : super(
          contributionType: ContributionType.photo,
        );

  final photoFile = Rxn<File>();
  final photoUrl = RxnString();

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
    _secondStepValidationWorker = everAll([photoFile, photoUrl], (_) {
      isSecondStepValid.value =
          photoFile.value != null || photoUrl.value != null;
    });
  }

  @override
  Contribution createContributionModel() {
    return PhotoContribution(
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
      image: MediaItem(
        id: 0,
        url: photoUrl.value,
        file: photoFile.value,
        name: relatedWordController.text,
      ),
    );
  }
}
