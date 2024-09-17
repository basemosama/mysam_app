import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/app/profile/data/datasource/profile_data_source.dart';
import 'package:mysam_app/core/models/media_item.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:playx/playx.dart';

///This class is responsible of retrieving data from the network.
class RemoteAuthDataSource {
  static final RemoteAuthDataSource _instance =
      RemoteAuthDataSource._internal();

  factory RemoteAuthDataSource() {
    return _instance;
  }

  RemoteAuthDataSource._internal();

  final PlayxNetworkClient client = Get.find<PlayxNetworkClient>();
  final _profileDataSource = ProfileDataSource();

  Future<NetworkResult<ApiUser>> login({
    required String email,
    required String password,
  }) async {
    final res = await client.post<ApiUser>(
      Endpoints.login,
      attachCustomHeaders: false,
      body: {
        'identifier': email,
        'password': password,
      },
      fromJson: ApiUser.fromJson,
    );
    if (res is NetworkError<ApiUser>) {
      final error = res.error;
      if (error is ApiException &&
          error.message == 'Invalid identifier or password') {
        return const NetworkResult.error(
          ApiException(
            errorMessage: AppTrans.emailOrPasswordIncorrect,
            statusCode: 400,
          ),
        );
      }
    }
    return res;
  }

  Future<NetworkResult<ApiUser>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final res = await client.post<ApiUser>(
      Endpoints.register,
      attachCustomHeaders: false,
      body: {
        'username': email,
        'email': email,
        'password': password,
      },
      fromJson: ApiUser.fromJson,
    );

    return _updateUserInfo(res: res, firstName: firstName, lastName: lastName);
  }

  Future<NetworkResult<ApiUser>> _updateUserInfo({
    required NetworkResult<ApiUser> res,
    required String firstName,
    required String lastName,
    MediaItem? image,
  }) async {
    if (res is NetworkSuccess<ApiUser>) {
      final user = res.data.userInfo;
      final token = res.data.jwt;

      final updatedUser = user.copyWith(
        firstName: firstName,
        lastName: lastName,
        image: image,
      );

      final updateUserRes = await _profileDataSource.updateUser(
          user: updatedUser, jwtToken: token,);
      if (updateUserRes is NetworkSuccess<ApiUserInfo> && token.isNotEmpty) {
        return NetworkSuccess(
          ApiUser(
            jwt: res.data.jwt,
            userInfo: updateUserRes.data,
          ),
        );
      }
    }
    return res;
  }

  Future<NetworkResult<ApiUser>> otpLogin({
    required String phoneNumber,
  }) async {
    final res = await client.post<ApiUser>(
      Endpoints.login,
      attachCustomHeaders: false,
      body: {
        'identifier': phoneNumber,
      },
      fromJson: ApiUser.fromJson,
    );
    return res;
  }

  Future<NetworkResult<ApiUser>> verifyOtpCode({required String pin}) {
    return client.post<ApiUser>(
      Endpoints.register,
      attachCustomHeaders: false,
      body: {
        'pin': pin,
      },
      fromJson: ApiUser.fromJson,
    );
  }
}
