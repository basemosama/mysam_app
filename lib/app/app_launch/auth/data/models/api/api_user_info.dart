// ignore_for_file: avoid_dynamic_calls

import 'package:mysam_app/app/app_launch/auth/data/models/api/role.dart';
import 'package:mysam_app/core/models/media_item.dart';
import 'package:playx/playx.dart';

class ApiUserInfo {
  final int? id;
  final String documentId;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final MediaItem? image;
  final String? provider;
  final String? createdAt;
  final String? updatedAt;
  final ApiRole? role;
  final bool? confirmed;
  final bool? blocked;

  ApiUserInfo({
    this.id,
    required this.documentId,
    this.username,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.confirmed,
    this.blocked,
    this.role,
  });

  String? getFullName({
    bool fallbackAsUserName = true,
    bool fallbackAsEmail = true,
  }) {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    if (firstName != null) {
      return firstName;
    }
    if (lastName != null) {
      return lastName;
    }
    if (fallbackAsUserName && username != null) {
      return username;
    }
    if (fallbackAsEmail && email != null) {
      return email;
    }
    return null;
  }

  factory ApiUserInfo.fromJson(dynamic json) {
    final map = json as Map<String, dynamic>;
    return ApiUserInfo(
      documentId: asString(map, 'documentId'),
      id: asIntOrNull(map, 'id'),
      username: asStringOrNull(map, 'username'),
      email: asStringOrNull(map, 'email'),
      firstName: asStringOrNull(json, 'firstName'),
      lastName: asStringOrNull(json, 'lastName'),
      image: json['image'] == null
          ? null
          : MediaItem.fromJson(asMap(json, 'image')),
      provider: asStringOrNull(map, 'provider'),
      createdAt: asStringOrNull(map, 'createdAt'),
      updatedAt: asStringOrNull(map, 'updatedAt'),
      confirmed: asBoolOrNull(map, 'confirmed'),
      blocked: asBoolOrNull(map, 'blocked'),
      role: map['role'] != null ? ApiRole.fromJson(map['role']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    // map['documentId'] = documentId;
    map['username'] = username;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['imageUrl'] = image?.toJson();
    map['provider'] = provider;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['confirmed'] = confirmed;
    map['blocked'] = blocked;
    if (role != null) {
      map['role'] = role?.toJson();
    }
    return map;
  }

  @override
  String toString() {
    return 'User{ id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, imageUrl: ${image?.url}, provider: $provider, createdAt: $createdAt, updatedAt: $updatedAt, confirmed: $confirmed, blocked: $blocked, role: $role}';
  }

  ApiUserInfo copyWith({
    int? id,
    String? documentId,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    MediaItem? image,
    String? provider,
    String? createdAt,
    String? updatedAt,
    bool? confirmed,
    bool? blocked,
    ApiRole? role,
  }) {
    return ApiUserInfo(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      provider: provider ?? this.provider,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      confirmed: confirmed ?? this.confirmed,
      blocked: blocked ?? this.blocked,
      role: role ?? this.role,
    );
  }
}
