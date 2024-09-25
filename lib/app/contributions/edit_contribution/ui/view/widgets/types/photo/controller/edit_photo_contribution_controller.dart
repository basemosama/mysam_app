part of '../../../../../imports/edit_contribution_imports.dart';

class EditPhotoContributionController extends EditContributionController {
  EditPhotoContributionController({
    required super.contribution,
    required super.root,
  });

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
    photoUrl.value = (contribution as PhotoContribution).image?.url;
    isSecondStepValid.value = true;
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
    final contributionImage = (contribution as PhotoContribution).image;
    final shouldUpdateImage = photoFile.value != null ||
        contributionImage?.url != null &&
            contributionImage?.url == photoUrl.value;

    final image = shouldUpdateImage
        ? MediaItem(
            id: 0,
            url: photoUrl.value,
            file: photoFile.value,
            name: relatedWordController.text,
          )
        : contributionImage;
    return PhotoContribution(
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
      image: image,
    );
  }
}
