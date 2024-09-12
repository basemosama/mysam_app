import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/auth0Exception.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/login_method.dart';
import 'package:mysam_app/core/config/constant.dart';
import 'package:mysam_app/core/models/media_item.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:playx/playx.dart';

class Auth0AuthDataSource {
  static final Auth0AuthDataSource _instance = Auth0AuthDataSource._internal();

  factory Auth0AuthDataSource() {
    return _instance;
  }

  Auth0AuthDataSource._internal();

  final _auth0 = Auth0(Constants.auth0Domain, Constants.auth0ClientId);

  final PlayxNetworkClient _client = Get.find<PlayxNetworkClient>();

  Future<bool> get hasValidCredentials async =>
      await _auth0.credentialsManager.hasValidCredentials();

  Future<bool> get isLoggedIn async => await hasValidCredentials;

  // Use a Universal Link callback URL on iOS 17.4+ / macOS 14.4+
  // useHTTPS is ignored on Android
  Future<NetworkResult<ApiUser>> login({
    LoginMethod method = LoginMethod.auth0Web,
  }) async {
    try {
      final credentials = await _auth0.webAuthentication().login(
        useHTTPS: true,
        parameters: {
          'connection': method.auth0Connection,
        },
      );

      final res = await _client.get(
        Endpoints.loginViaAuth0,
        query: {
          'access_token': credentials.accessToken,
        },
        fromJson: (json) => ApiUser.fromJson(
          json,
          image: MediaItem(
            url: credentials.user.pictureUrl.toString(),
          ),
        ),
        attachCustomHeaders: false,
      );

      return _updateUserInfo(res: res, credentials: credentials);
    } on WebAuthenticationException catch (e) {
      Sentry.captureException(e);
      return NetworkResult.error(
        Auth0exception(
          errorCode: e.code,
          auth0ErrorMessage: e.message,
          errorDetails: e.details,
        ),
      );
    } on Exception catch (e) {
      Sentry.captureException(e);
      return const NetworkResult.error(
        UnexpectedErrorException(errorMessage: AppTrans.unexpectedError),
      );
    }
  }

  Future<NetworkResult<ApiUser>> _updateUserInfo({
    required NetworkResult<ApiUser> res,
    required Credentials credentials,
  }) async {
    if (res is NetworkSuccess<ApiUser>) {
      final user = res.data.userInfo;
      final token = res.data.jwt;

      // Update only when user first name or last name is null
      if (user.firstName == null ||
          user.firstName!.isEmpty ||
          user.lastName == null ||
          user.lastName!.isEmpty) {
        final firstName = user.firstName ??
            credentials.user.givenName ??
            credentials.user.name;
        final lastName = user.lastName ?? credentials.user.familyName;
        final imageUrl = credentials.user.pictureUrl.toString();
        final image = user.image ?? MediaItem(url: imageUrl);

        final updatedUser = user.copyWith(
          firstName: firstName,
          lastName: lastName,
          image: image,
        );

        final updateUserRes =
            await updateUser(user: updatedUser, jwtToken: token);
        if (updateUserRes is NetworkSuccess<ApiUserInfo> && token.isNotEmpty) {
          return NetworkSuccess(
            ApiUser(
              jwt: res.data.jwt,
              userInfo: updateUserRes.data,
            ),
          );
        }
      }
    }
    return res;
  }

  Future<NetworkResult<ApiUserInfo>> updateUser({
    required ApiUserInfo user,
    String? jwtToken,
  }) async {
    final token = jwtToken ?? MyPreferenceManger.instance.token;

    // bool isImageError = false;
    // if (updatedImage != null && updatedImage.id == null) {
    //   final uploadRes = await ApiHelper.instance.uploadImage(
    //     image: updatedImage,
    //     jwtToken: token,
    //   );
    //   uploadRes.when(
    //     success: (MediaItem success) {
    //       updatedImage = success;
    //     },
    //     error: (NetworkException error) {
    //       isImageError = true;
    //     },
    //   );
    // }

    return _client.put(
      Endpoints.updateUser,
      body: {
        'firstName': user.firstName,
        'lastName': user.lastName,
        // if (!isImageError) 'image': updatedImage?.id,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
      fromJson: ApiUserInfo.fromJson,
      attachCustomHeaders: false,
    );
  }

  Future<Credentials?> getCredentials() async {
    try {
      final res = await _auth0.credentialsManager.credentials();
      return res;
    } on CredentialsManagerException {
      return null;
    }
  }

  Future<void> logout() {
    return _auth0.webAuthentication().logout();
  }
}
