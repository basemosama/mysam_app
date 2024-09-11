import 'package:mysam_app/app/app_launch/auth/data/data_sources/auth0_auth_data_source.dart';
import 'package:mysam_app/app/app_launch/auth/data/data_sources/remote_auth_data_source.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/login_method.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/user.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:playx/playx.dart';

/// This is the repository where we should handle the data and return it to the controller.
class AuthRepository {
  final RemoteAuthDataSource _remoteDataSource = RemoteAuthDataSource();
  final _auth0DataSource = Auth0AuthDataSource();

  final MyPreferenceManger _preferenceManger = MyPreferenceManger.instance;

  static final AuthRepository _instance = AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();

  Future<NetworkResult<ApiUser>> loginViaAuth0({
    LoginMethod method = LoginMethod.auth0Web,
  }) async {
    final res = await _auth0DataSource.login(method: method);
    return handleSavingUser(res);
  }

  Future<bool> get isAuthenticatedViaAuth0 async {
    final res = await _auth0DataSource.hasValidCredentials;
    return res;
  }

  Future<bool> isLoggedIn({bool checkAuth0Credentials = true}) async {
    if (checkAuth0Credentials) {
      return await _auth0DataSource.isLoggedIn && _preferenceManger.isLoggedIn;
    }
    return _preferenceManger.isLoggedIn;
  }

  Future<bool> isLoggedOut({bool checkAuth0Credentials = true}) async =>
      !(await isLoggedIn(checkAuth0Credentials: checkAuth0Credentials));

  Future<ApiUser?> getAuth0AuthedUser() async {
    final res = await _auth0DataSource.getCredentials();
    if (res != null) {
      final user = ApiUser(
        jwt: res.accessToken,
        user: User(
          id: res.idToken,
          username: res.idToken,
          email: res.idToken,
          provider: res.idToken,
        ),
      );
      return user;
    }
    return null;
  }

  Future<NetworkResult<ApiUser>> loginViaEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final NetworkResult<ApiUser> result = await _remoteDataSource.login(
      email: email,
      password: password,
    );
    return handleSavingUser(result);
  }

  Future<NetworkResult<ApiUser>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final res = await _remoteDataSource.register(
      email: email,
      password: password,
    );
    return handleSavingUser(res);
  }

  NetworkResult<ApiUser> handleSavingUser(NetworkResult<ApiUser> result) {
    result.when(
      success: (ApiUser userData) async {
        final String? token = userData.jwt;
        final User? user = userData.user;
        if (token != null) {
          await _preferenceManger.saveToken(token);
          if (user != null) {
            await _preferenceManger.saveUser(user);
          }
        } else {
          return const NetworkResult.error(
            EmptyResponseException(
              errorMessage: AppTrans.emptyResponse,
              statusCode: 400,
            ),
          );
        }
      },
      error: (NetworkException exception) {},
    );

    return result;
  }

  Future<void> logout({bool logOutFromAuth0 = true}) async {
    await _preferenceManger.signOut();
    await Future.delayed(const Duration(seconds: 2));
    if (logOutFromAuth0) {
      try {
        await _auth0DataSource.logout();
      } catch (e) {
        Sentry.captureException(e);
      }
    }
  }
}
