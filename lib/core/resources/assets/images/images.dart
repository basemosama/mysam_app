import 'package:mysam_app/core/utils/app_utils.dart';

class Images {
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  Images._internal();

  final String logo = 'assets/images/svg/logo.svg';
  final String logoDark = 'assets/images/svg/logo-dark.svg';

  String get logoBasedOnTheme => AppUtils.isDarkMode() ? logo : logoDark;

  final String placeholder = 'assets/images/svg/placeholder.svg';
  final String profilePlaceholder = 'assets/images/svg/profile_placeholder.svg';

  final String arabicOnboarding1 = 'assets/images/png/arabic1.png';
  final String arabicOnboarding2 = 'assets/images/png/arabic2.png';
  final String communityOnboarding = 'assets/images/png/community.png';
}
