import 'dart:convert';

import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_user_info_to_user_info_mapper.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/login_method.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

/// This class is responsible for saving key/value pairs in shared preferences.
class MyPreferenceManger {
  static final MyPreferenceManger instance = Get.find<MyPreferenceManger>();

  final String _tokenKey = 'token';
  final String _userKey = 'logged_in_user';
  final String _onBoardingKey = 'onboarding_key';
  final String _loginMethodKey = 'login_method';
  final String _savedEmailKey = 'saved_email';
  final String _savedPasswordKey = 'saved_password';

  Future<bool> get isLoggedIn async =>
      (await PlayxSecurePrefs.getString(_tokenKey)).isNotEmpty;

  Future<bool> get isLoggedOut async => !(await isLoggedIn);

  Future<LoginMethod?> get loginMethod async {
    final String? value =
        await PlayxSecurePrefs.maybeGetString(_loginMethodKey);
    return LoginMethod.fromValue(value);
  }

  Future<void> saveLoginMethod(LoginMethod method) async {
    await PlayxSecurePrefs.setString(_loginMethodKey, method.value);
  }

  Future<String?> get token async => PlayxSecurePrefs.maybeGetString(_tokenKey);

  Future<void> saveToken(String jwt) async {
    await PlayxSecurePrefs.setString(_tokenKey, jwt);
  }

  Future<void> saveUser(ApiUserInfo user) async {
    final String userString = jsonEncode(user);
    return PlayxSecurePrefs.setString(_userKey, userString);
  }

  Future<UserInfo?> getSavedUser() async {
    final String jsonString = await PlayxSecurePrefs.getString(_userKey);
    if (jsonString.isEmpty) {
      return null;
    }

    return jsonString.mapAsyncInIsolate((e) {
      final json = jsonDecode(e) as Map<String, dynamic>;
      final ApiUserInfo user = ApiUserInfo.fromJson(json);
      return user.toUserInfo();
    });
  }

  Future<void> signOut() async {
    await PlayxSecurePrefs.remove(_userKey);
    return PlayxSecurePrefs.remove(_tokenKey);
  }

  Future<bool> get isOnBoardingShown async =>
      PlayxPrefs.getBool(_onBoardingKey);

  Future<void> saveOnBoardingShown() async {
    return PlayxPrefs.setBool(_onBoardingKey, true);
  }

  Future<void> saveLoginInfo(
      {required String email, required String password,}) async {
    await saveEmail(email: email);
    return savePassword(password: password);
  }

  Future<void> saveEmail({required String email}) {
    return PlayxSecurePrefs.setString(_savedEmailKey, email);
  }

  Future<void> savePassword({required String password}) {
    return PlayxSecurePrefs.setString(_savedPasswordKey, password);
  }

  Future<String?> getSavedEmail() async {
    return PlayxSecurePrefs.maybeGetString(_savedEmailKey);
  }

  Future<String?> getSavedPassword() async {
    return PlayxSecurePrefs.maybeGetString(_savedPasswordKey);
  }
}
