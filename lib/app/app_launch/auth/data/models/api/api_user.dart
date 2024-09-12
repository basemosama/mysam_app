import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/api_user_info.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/api/role.dart';
import 'package:mysam_app/core/models/media_item.dart';

/// Api user model.
class ApiUser {
  final String jwt;
  final ApiUserInfo userInfo;
  final ApiRole? role;

  ApiUser({
    required this.jwt,
    required this.userInfo,
    this.role,
  });

  factory ApiUser.fromJson(dynamic json) {
    final map = json as Map<String, dynamic>;
    final jwt = map['jwt'] as String;
    final user = ApiUserInfo.fromJson(map['user']);
    final role = map['role'] != null ? ApiRole.fromJson(map['role']) : null;
    return ApiUser(
      jwt: jwt,
      userInfo: user,
      role: role,
    );
  }

  static ApiUser? fromJsonOrNull(dynamic json) {
    if (json == null) return null;
    return ApiUser.fromJson(json);
  }

  factory ApiUser.fromJsonAndCredentials({
    dynamic json,
    required Credentials credentials,
  }) {
    final apiUser = ApiUser.fromJson(json);
    final firstName = credentials.user.givenName ?? credentials.user.name;
    final lastName = credentials.user.familyName;
    final imageUrl = credentials.user.pictureUrl.toString();
    final user = ApiUser(
      jwt: apiUser.jwt,
      userInfo: apiUser.userInfo.copyWith(
        firstName: firstName,
        lastName: lastName,
        image: MediaItem(url: imageUrl),
      ),
    );
    return user;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jwt'] = jwt;
    map['user'] = userInfo.toJson();
    if (role != null) {
      map['role'] = role!.toJson();
    }
    return map;
  }
}
