import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';

/// Api user model.
class User {
  final String jwtToken;
  final UserInfo info;

  User({
    required this.jwtToken,
    required this.info,
  });
}
