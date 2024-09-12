import 'package:mysam_app/app/app_launch/auth/data/models/api/role.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/role.dart';

extension ApiRoleToRoleMapper on ApiRole {
  Role toRole() {
    return Role(
      id: id,
      name: name,
      description: description,
      type: type,
      v: v,
    );
  }
}

extension RoleToApiRoleMapper on Role {
  ApiRole toApiRole() {
    return ApiRole(
      id: id,
      name: name,
      description: description,
      type: type,
      v: v,
    );
  }
}
