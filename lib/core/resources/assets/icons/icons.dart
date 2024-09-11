class Icons {
  static final Icons _instance = Icons._internal();

  factory Icons() {
    return _instance;
  }

  Icons._internal();

  final String apple = 'assets/icons/apple.svg';
  final String google = 'assets/icons/google.svg';
}
