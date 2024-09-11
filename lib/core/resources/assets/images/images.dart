class Images {
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  Images._internal();

  final String logo = 'assets/images/svg/logo.svg';

  final String placeholder = 'assets/images/placeholder.svg';
  final String profilePlaceholder = 'assets/images/profile_placeholder.svg';

  final String arabicOnboarding1 = 'assets/images/png/arabic1.png';
  final String arabicOnboarding2 = 'assets/images/png/arabic2.png';
  final String communityOnboarding = 'assets/images/png/community.png';
}
