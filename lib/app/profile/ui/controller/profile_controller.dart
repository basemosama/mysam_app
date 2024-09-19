part of '../imports/profile_imports.dart';

class ProfileController extends GetxController {
  final userDataState = RxDataState<UserInfo>.initial();
  CustomNavigationDrawerController get drawerController =>
      Get.find<CustomNavigationDrawerController>();

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    userDataState.value = const DataState.loading();
    final user = await MyPreferenceManger.instance.getSavedUser();
    if (user != null) {
      userDataState.value = DataState.success(user);
    } else {
      userDataState.value =
          DataState.fromDefaultError(error: AppTrans.unexpectedError);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void navigateToSettings() {
    AppNavigation.navigateToSettings();
  }

  void editProfileName({required BuildContext context}) {
    EditProfileController.showEditNameModal(context: context);
  }

  Future<void> logout() async {
    drawerController.updateLoginStatus(isLoggingOut: true);
    try {
      await ApiHelper.instance.logout();
    } catch (e) {
      Alert.error(message: e.toString());
    }
    await Future.delayed(const Duration(milliseconds: 200));
    AppNavigation.navigateToSplash();
    drawerController.updateLoginStatus(isLoggingOut: false);
  }
}
