class OnBoarding {
  final String title;
  final String? subtitle;
  final String? lottieAsset;
  final String? svgImageAsset;
  final String? imageAsset;
  final String? imageUrlAsset;

  const OnBoarding._({
    required this.title,
    required this.subtitle,
    this.lottieAsset,
    this.svgImageAsset,
    this.imageAsset,
    this.imageUrlAsset,
  });

  factory OnBoarding.lottie({
    required String title,
    required String subtitle,
    required String lottieAsset,
  }) {
    return OnBoarding._(
      title: title,
      subtitle: subtitle,
      lottieAsset: lottieAsset,
    );
  }

  factory OnBoarding.svgImageAsset({
    required String title,
    required String subtitle,
    required String svgImageAsset,
  }) {
    return OnBoarding._(
      title: title,
      subtitle: subtitle,
      svgImageAsset: svgImageAsset,
    );
  }

  factory OnBoarding.imageAsset({
    required String title,
    required String subtitle,
    required String imageAsset,
  }) {
    return OnBoarding._(
      title: title,
      subtitle: subtitle,
      imageAsset: imageAsset,
    );
  }

  factory OnBoarding.imageUrl({
    required String title,
    required String subtitle,
    required String imageUrlAsset,
  }) {
    return OnBoarding._(
      title: title,
      subtitle: subtitle,
      imageUrlAsset: imageUrlAsset,
    );
  }

  bool get hasLottie => lottieAsset != null;

  bool get hasSvgImage => svgImageAsset != null;

  bool get hasImageAsset => imageAsset != null;

  bool get hasImageUrl => imageUrlAsset != null;
}
