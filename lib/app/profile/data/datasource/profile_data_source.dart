import 'package:mysam_app/app/app_launch/auth/data/models/api/api_profile.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:playx/playx.dart';

class ProfileDataSource {
  static final ProfileDataSource _instance = ProfileDataSource._internal();

  factory ProfileDataSource() {
    return _instance;
  }

  ProfileDataSource._internal();

  final PlayxNetworkClient client = ApiClient.client;

  Future<NetworkResult<ApiProfile>> getProfile({
    String? jwtToken,
  }) async {
    final token = jwtToken ?? await MyPreferenceManger.instance.token;

    if (token == null) {
      return const NetworkResult.error(
        UnexpectedErrorException(
          errorMessage: 'Token is null',
        ),
      );
    }

    final res = await client.get<ApiProfile>(
      Endpoints.profile,
      fromJson: ApiProfile.fromJson,
      attachCustomHeaders: false,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return res;
  }

  Future<NetworkResult<ApiUserInfo>> updateUser({
    required ApiUserInfo user,
    String? jwtToken,
  }) async {
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
    return updateProfileName(
      firstName: user.firstName,
      lastName: user.lastName,
      jwtToken: jwtToken,
    );
  }

  Future<NetworkResult<ApiUserInfo>> updateProfileName({
    required String? firstName,
    required String? lastName,
    String? jwtToken,
  }) async {
    final token = jwtToken ?? await MyPreferenceManger.instance.token;

    return client.put(
      Endpoints.updateUser,
      body: {
        'firstName': firstName,
        'lastName': lastName,
        // if (!isImageError) 'image': updatedImage?.id,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
      fromJson: ApiUserInfo.fromJson,
      attachCustomHeaders: false,
    );
  }
}
