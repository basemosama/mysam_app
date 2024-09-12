import 'package:mysam_app/app/app_launch/auth/data/models/api/api_profile.dart';
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
}
