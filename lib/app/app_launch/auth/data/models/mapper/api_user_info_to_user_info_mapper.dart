import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_role_to_role.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';

extension ApiUserInfoToUserInfoMapper on ApiUserInfo {
  UserInfo toUserInfo() {
    return UserInfo(
      id: id,
      documentId: documentId,
      username: username,
      email: email,
      provider: provider,
      createdAt: DateTime.tryParse(createdAt ?? ''),
      updatedAt: DateTime.tryParse(updatedAt ?? ''),
      role: role?.toRole(),
      confirmed: confirmed,
      blocked: blocked,
      firstName: firstName,
      lastName: lastName,
      image: image,
    );
  }
}

extension UserInfoToApiUserInfoMapper on UserInfo {
  ApiUserInfo toApiUserInfo() {
    return ApiUserInfo(
      id: id,
      documentId: documentId ?? '',
      username: username,
      email: email,
      provider: provider,
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      role: role?.toApiRole(),
      confirmed: confirmed,
      blocked: blocked,
      firstName: firstName,
      lastName: lastName,
      image: image,
    );
  }
}
