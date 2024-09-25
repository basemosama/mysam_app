import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_role_type.dart';

class Role {
  // 1
  final int id;
  // tsggss
  final String documentId;
  // Authenticated
  final String name;
  // Default role given to authenticated user.
  final String? description;
  // authenticated
  final UserRoleType type;
  // 2024-09-10T13:10:32.075Z
  final DateTime? createdAt;
  // 2024-09-11T23:22:05.628Z
  final DateTime? updatedAt;
  // 2024-09-10T13:10:32.075Z
  final DateTime? publishedAt;

  const Role({
    required this.id,
    required this.documentId,
    required this.name,
    this.description,
    required this.type,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
}
