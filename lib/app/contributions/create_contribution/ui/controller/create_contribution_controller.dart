part of '../imports/create_contribution_imports.dart';

class CreateContributionController extends GetxController {
  final Root root;
  final ContributionType contributionType;

  final currentStepIndex = 0.obs;

  final currentStepCount = 2;

  bool get isLastStep => currentStepIndex.value == currentStepCount - 1;

  final TextEditingController rootWordController = TextEditingController();
  final TextEditingController relatedWordController = TextEditingController();
  final TextEditingController relatedWordWeightController =
      TextEditingController();
  final TextEditingController relatedWordPropertiesController =
      TextEditingController();

  final Rxn<ContributionRelatedWordType> relatedWordType =
      Rxn<ContributionRelatedWordType>();
  final RxList<String> relatedWordProperties = <String>[].obs;

  final isRelatedWordValid = false.obs;
  final isRelatedWordWeightValid = false.obs;

  final relatedWordFocusNode = FocusNode();
  final relatedWordWeightFocusNode = FocusNode();
  final relatedWordPropertiesFocusNode = FocusNode();

  RxBool isMainFormValid = false.obs;

  Worker? _mainFormValidator;

  bool get isNextOrFinishButtonEnabled {
    switch (currentStepIndex.value) {
      case 0:
        return isMainFormValid.value;
      default:
        return false;
    }
  }

  CreateContributionController({
    required this.root,
    required this.contributionType,
  });

  @override
  void onInit() {
    rootWordController.text = root.value;
    super.onInit();
    _validateMainForm();
  }

  void _validateMainForm() {
    _mainFormValidator?.dispose();
    _mainFormValidator = everAll([
      relatedWordType,
      // relatedWordProperties,
      isRelatedWordValid,
      isRelatedWordWeightValid,
    ], (values) {
      isMainFormValid.value = relatedWordType.value != null &&
          // relatedWordProperties.isNotEmpty &&
          isRelatedWordValid.value &&
          isRelatedWordWeightValid.value;
    });
  }

  void handleNextOrFinish() {
    if (isLastStep) {
      currentStepIndex.value = 0;

      createContribution();
    } else {
      currentStepIndex.value++;
    }
  }

  void createContribution() {}

  void addRelatedWordProperties() {
    final text = relatedWordPropertiesController.text;
    if (text.isEmpty) return;

    if (relatedWordProperties.contains(text)) {
      relatedWordPropertiesController.clear();
      return;
    }

    relatedWordProperties.add(
      relatedWordPropertiesController.text,
    );
    relatedWordPropertiesController.clear();
  }

  @override
  void onClose() {
    _mainFormValidator?.dispose();
    rootWordController.dispose();
    relatedWordController.dispose();
    relatedWordWeightController.dispose();
    relatedWordPropertiesController.dispose();
    relatedWordProperties.clear();
    relatedWordFocusNode.dispose();
    relatedWordWeightFocusNode.dispose();
    relatedWordPropertiesFocusNode.dispose();
    super.onClose();
  }
}
