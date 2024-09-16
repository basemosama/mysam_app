import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:playx/playx.dart';

///This class is responsible of retrieving data from the network.
class TestAuthDataSource {
  static final TestAuthDataSource _instance = TestAuthDataSource._internal();

  factory TestAuthDataSource() {
    return _instance;
  }

  TestAuthDataSource._internal();

  Future<NetworkResult<ApiUser>> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return NetworkResult.success(
      ApiUser(
        jwt: 'sasdfasfafa',
        userInfo: ApiUserInfo(
          documentId: 'sdas',
          username: 'mohamed.ahmed',
          email: 'mohamed.ahmed@gmail.com',
          id: 122,
        ),
      ),
    );
  }

  Future<NetworkResult<ApiUser>> otpLogin({
    required String phoneNumber,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return NetworkResult.success(
      ApiUser(
        jwt: 'sasdfasfafa',
        userInfo: ApiUserInfo(
          documentId: 'sdas',
          username: 'mohamed.ahmed',
          email: 'mohamed.ahmed@gmail.com',
          id: 122,
        ),
      ),
    );
  }

  Future<NetworkResult<ApiUser>> verifyOtpCode({required String pin}) async {
    await Future.delayed(const Duration(seconds: 3));
    return NetworkResult.success(
      ApiUser(
        jwt: 'sasdfasfafa',
        userInfo: ApiUserInfo(
          documentId: 'sdas',
          username: 'mohamed.ahmed',
          email: 'mohamed.ahmed@gmail.com',
          id: 122,
        ),
      ),
    );
  }

  Future<NetworkResult<ApiUser>> register({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 3));
    return NetworkResult.success(
      ApiUser(
        jwt: 'sasdfasfafa',
        userInfo: ApiUserInfo(
          documentId: 'sdas',
          username: 'mohamed.ahmed',
          email: 'mohamed.ahmed@gmail.com',
          id: 122,
        ),
      ),
    );
  }
}
