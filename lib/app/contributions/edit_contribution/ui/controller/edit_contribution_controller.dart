part of '../imports/edit_contribution_imports.dart';

sealed class EditContributionController extends GetxController {
  final Contribution contribution;
  final Root root;

  EditContributionController({
    required this.contribution,
    required this.root,
  });

  final _repository = EditContributionRepository();
  final pageController = PageController();

  final currentStepIndex = 0.obs;

  final currentStepCount = 2;

  /// Check if the current step is the last step
  /// Last page is the page before the last step
  bool get isLastStep => currentStepIndex.value == currentStepCount - 1;

  final isReceivedContributionStep = false.obs;

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

  CustomNavigationDrawerController get _drawerController =>
      Get.find<CustomNavigationDrawerController>();

  bool get isNextOrFinishButtonEnabled {
    switch (currentStepIndex.value) {
      case 0:
        return isMainFormValid.value;
      default:
        return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    setupFields();
    _validateMainForm();
  }

  void setupFields();

  void _setupMainForum() {
    rootWordController.text = root.value;
    relatedWordController.text = contribution.relatedWord.word;
    relatedWordWeightController.text = contribution.relatedWord.weight ?? '';
    relatedWordType.value = contribution.relatedWord.type;
    relatedWordProperties.addAll(contribution.relatedWord.metadata ?? []);
    isRelatedWordValid.value = true;
    isRelatedWordWeightValid.value = true;
    isMainFormValid.value = true;
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
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      editContribution();
    } else {
      currentStepIndex.value++;
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      pageController.animateToPage(
        currentStepIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void handleBack() {
    if (currentStepIndex.value == 0 || isReceivedContributionStep.value) {
      if (Get.isRegistered<RootDetailsController>()) {
        Get.find<RootDetailsController>().refreshRoot();
      }
      if (Get.isRegistered<ReviewDetailsController>()) {
        Get.find<ReviewDetailsController>().refreshContribution();
      }
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

  Future<void> editContribution() async {
    _drawerController.updateLoadingStatus(isLoading: true);
    final contribution = createContributionModel();
    final res = await _repository.editContribution(contribution: contribution);
    res.when(
      success: (contribution) {
        Alert.success(
          message: AppTrans.contributionEditedSuccessfully
              .tr(args: [contribution.relatedWord.word]),
        );
        _drawerController.updateLoadingStatus(isLoading: false);

        isReceivedContributionStep.value = true;
      },
      error: (error) {
        Alert.error(message: error.message);
        _drawerController.updateLoadingStatus(isLoading: false);
      },
    );
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
