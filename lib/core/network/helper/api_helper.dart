import 'package:mysam_app/app/app_launch/auth/data/data_sources/auth0_auth_data_source.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/login_method.dart';
import 'package:mysam_app/core/models/media_item.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() {
    return _instance;
  }

  ApiHelper._internal();

  static ApiHelper get instance => _instance;

  final _client = ApiClient.client;
  final _preferenceManger = MyPreferenceManger.instance;
  final _auth0DataSource = Auth0AuthDataSource();

  static NetworkResult<T> unableToProcessError<T>() =>
      const NetworkResult.error(UnableToProcessException(
          errorMessage: AppTrans.unableToProcess, statusCode: 400,),);

  Future<NetworkResult<MediaItem>> uploadImage({
    required MediaItem image,
    String? jwtToken,
  }) async {
    final data = await image.toFormData();
    if (data == null) {
      return const NetworkResult.error(
        EmptyResponseException(
          statusCode: 400,
          errorMessage: AppTrans.emptyResponse,
        ),
      );
    }

    final token = jwtToken ?? await MyPreferenceManger.instance.token;

    final res = await _client.postList(
      Endpoints.upload,
      body: data,
      attachCustomHeaders: false,
      headers: {
        if (token != null) 'Authorization': 'Bearer $token',
      },
      fromJson: (json) => MediaItem.fromJson(json),
      contentType: 'multipart/form-data',
    );

    return res.mapDataAsyncInIsolate(
      mapper: (data) async {
        return NetworkSuccess(
          data[0],
        );
      },
    );
  }

  Future<bool> isLoggedIn() async {
    final loginMethod = await _preferenceManger.loginMethod;

    final checkAuth0Credentials =
        loginMethod != null && loginMethod != LoginMethod.email;

    final isLoggedInAndSavedToPref = await _preferenceManger.isLoggedIn;

    if (checkAuth0Credentials) {
      return await _auth0DataSource.isLoggedIn && isLoggedInAndSavedToPref;
    }
    return isLoggedInAndSavedToPref;
  }

  Future<bool> isLoggedOut() async => !(await isLoggedIn());

  Future<void> logout() async {
    await _preferenceManger.signOut();

    final loginMethod = await _preferenceManger.loginMethod;

    final logOutFromAuth0 =
        loginMethod != null && loginMethod != LoginMethod.email;

    if (logOutFromAuth0) {
      try {
        await _auth0DataSource.logout();
      } catch (e) {
        Sentry.captureException(e);
      }
    }
  }
}
