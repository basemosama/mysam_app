part of '../imports/create_contribution_imports.dart';

sealed class CreateContributionController extends GetxController {
  final _repository = CreateContributionRepository();
  final pageController = PageController();

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

  final isLoading = false.obs;

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
      createContribution();
    } else {
      currentStepIndex.value++;
      pageController.animateToPage(
        currentStepIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void handleBack() {
    if (currentStepIndex.value == 0) {
      PlayxNavigation.pop();
    } else {
      currentStepIndex.value--;
      pageController.animateToPage(
        currentStepIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

  /// This method is used to create a contribution model
  /// based on the contribution type.
  /// Should be implemented in the child class.
  Contribution createContributionModel();

  Future<void> createContribution() async {
    isLoading.value = true;
    final contribution = createContributionModel();
    final res =
        await _repository.createContribution(contribution: contribution);
    res.when(success: (contribution) {
      Alert.success(message: 'Contribution created successfully');
      isLoading.value = false;
    }, error: (error) {
      Alert.error(message: error.message);
      isLoading.value = false;
    });
  }

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
