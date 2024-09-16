import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_profile_to_profile_mapper.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/profile_info.dart';
import 'package:mysam_app/app/profile/data/datasource/profile_data_source.dart';
import 'package:mysam_app/core/utils/mapper_utilites.dart';
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
  }) async {
    final res = await _profileDataSource.getProfile(jwtToken: jwtToken);
    return res.mapDataAsyncInIsolate(
      mapper: (data) async {
        return NetworkResult<ProfileInfo>.success(data.toProfileInfo());
      },
    );
  }




}
