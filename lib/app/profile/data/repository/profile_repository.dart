import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_profile_to_profile_mapper.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_user_info_to_user_info_mapper.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/profile_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';
import 'package:mysam_app/app/profile/data/datasource/profile_data_source.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class ProfileRepository {
  static final ProfileRepository _instance = ProfileRepository._internal();

  factory ProfileRepository() {
    return _instance;
  }

  ProfileRepository._internal();

  final ProfileDataSource _profileDataSource = ProfileDataSource();

  Future<NetworkResult<ProfileInfo>> getProfileInfo({
    String? jwtToken,
    required bool saveUserInfo,
  }) async {
    final res = await _profileDataSource.getProfile(jwtToken: jwtToken);
    final profileRes = await res.mapDataAsyncInIsolate(
      mapper: (data) async {
        return NetworkResult<ProfileInfo>.success(data.toProfileInfo());
      },
    );

    if (profileRes is NetworkSuccess<ProfileInfo>) {
      if (saveUserInfo) {
        final userInfo = profileRes.data.userInfo;
        await MyPreferenceManger.instance.saveUser(userInfo.toApiUserInfo());
        await MyPreferenceManger.instance.saveUserRoleType(userInfo.role?.type);
      }
    }
    return profileRes;
  }

  Future<NetworkResult<UserInfo>> updateProfileName({
    required String? firstName,
    required String? lastName,
  }) async {
    final res = await _profileDataSource.updateProfileName(
      firstName: firstName,
      lastName: lastName,
    );

    if (res is NetworkSuccess<ApiUserInfo>) {
      final savedUser = await MyPreferenceManger.instance.getSavedUser();

      final updatedUser = savedUser
              ?.copyWith(
                firstName: res.data.firstName,
                lastName: res.data.lastName,
              )
              .toApiUserInfo() ??
          res.data;
      await MyPreferenceManger.instance.saveUser(updatedUser);
    }

    return res.mapDataAsyncInIsolate(
      mapper: (data) async {
        return NetworkResult<UserInfo>.success(data.toUserInfo());
      },
    );
  }
}
