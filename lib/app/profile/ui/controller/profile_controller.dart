part of '../imports/profile_imports.dart';

class ProfileController extends GetxController {
  final userDataState = RxDataState<UserInfo>.initial();

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

  void editProfileName() {}

  void logout() {}
}
