import 'package:mysam_app/app/app_launch/auth/data/models/ui/role.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';

class ProfileInfo {
  final UserInfo userInfo;
  final Role? role;

  ProfileInfo({
    required this.userInfo,
    this.role,
  });
}
