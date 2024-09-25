part of '../../../imports/profile_imports.dart';

class EditProfileController extends GetxController {
  final _repository = ProfileRepository();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final isFirstNameValid = false.obs;
  final isLastNameValid = false.obs;

  final isFormValid = false.obs;

  Worker? _validateWorker;
  final dataState = RxDataState<UserInfo?>.initial();

  @override
  void onInit() {
    super.onInit();
    _setupFields();
    validateForm();
  }

  void validateForm() {
    _validateWorker?.dispose();
    _validateWorker = everAll([isFirstNameValid, isLastNameValid], (_) {
      isFormValid.value = isFirstNameValid.value && isLastNameValid.value;
    });
  }

  Future<void> _setupFields() async {
    dataState.value = const DataState.loading();
    final user = await MyPreferenceManger.instance.getSavedUser();
    firstNameController.text = user?.firstName ?? '';
    lastNameController.text = user?.lastName ?? '';
    isFirstNameValid.value = true;
    isLastNameValid.value = true;
    isFormValid.value = true;
    dataState.value = DataState.success(user);
  }

  Future<void> editProfileName() async {
    if (!isFormValid.value) {
      return;
    }

    dataState.value = const DataState.loading();

    final res = await _repository.updateProfileName(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
    res.when(
      success: (UserInfo data) {
        PlayxNavigation.pop();
        Alert.success(message: AppTrans.updatedProfileNameSuccessMessage);
        Get.find<ProfileController>().getUser();
      },
      error: (NetworkException error) {
        dataState.value = const DataState.success(null);
        Alert.error(message: error.message);
      },
    );
  }

  static Future<void> showEditNameModal({required BuildContext context}) async {
    final controller = EditProfileController();
    Get.put(controller);
    await CustomModal.showPageModal(
      context: context,
      pageBuilder: (ctx) => EditProfileNameView.buildPage(
        context: context,
      ),
    );
    Get.delete<EditProfileController>();
  }

  @override
  void onClose() {
    _validateWorker?.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
