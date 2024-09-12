import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_user_info_to_user_info_mapper.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user.dart';

extension ApiUserToUserMapper on ApiUser {
  User toUser() {
    return User(
      jwtToken: jwt,
      info: userInfo.toUserInfo(),
    );
  }
}

extension UserToApiUserMapper on User {
  ApiUser toApiUser() {
    return ApiUser(
      jwt: jwtToken,
      userInfo: info.toApiUserInfo(),
    );
  }
}
