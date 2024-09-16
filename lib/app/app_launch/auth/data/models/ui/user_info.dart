// ignore_for_file: avoid_dynamic_calls

import 'package:mysam_app/app/app_launch/auth/data/models/ui/role.dart';
import 'package:mysam_app/core/models/media_item.dart';

class UserInfo {
  final int? id;
  final String? documentId;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final MediaItem? image;
  final String? provider;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Role? role;
  final bool? confirmed;
  final bool? blocked;

  UserInfo({
    this.id,
    this.documentId,
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

  @override
  String toString() {
    return 'UserInfo{ id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, imageUrl: ${image?.url}, provider: $provider,confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, role: $role}';
  }
}
