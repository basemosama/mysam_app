import 'package:mysam_app/app/app_launch/auth/data/models/api/api_profile.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_role_to_role.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/profile_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';

extension ApiProfileToProfileMapper on ApiProfile {
  ProfileInfo toProfileInfo() {
    return ProfileInfo(
      userInfo: UserInfo(
        id: id,
        documentId: documentId,
        email: email,
        username: username,
        provider: provider,
        firstName: firstName,
        lastName: lastName,
        image: image,
        createdAt: DateTime.tryParse(createdAt ?? ''),
        updatedAt: DateTime.tryParse(updatedAt ?? ''),
        blocked: blocked,
        confirmed: confirmed,
      ),
      role: role?.toRole(),
    );
  }
}
