import 'package:playx/playx.dart';

const String arabicFontFamily = 'Cairo';
const String englishFontFamily = 'Poppins';

const _supportedLocales = [
  XLocale(id: 'en', name: 'English', languageCode: 'en'),
  XLocale(id: 'ar', name: 'العربية', languageCode: 'ar'),
];
PlayxLocaleConfig createLocaleConfig() => PlayxLocaleConfig(
      supportedLocales: _supportedLocales,
      fallbackLocale: _supportedLocales[1],
      startLocale: _supportedLocales[1],
    );

String get fontFamily => PlayxLocalization.isCurrentLocaleArabic()
    ? arabicFontFamily
    : englishFontFamily;

String fontFamilyBasedOnText(String text) {
  if (text.isEmpty) {
    return fontFamily;
  }
  return text.isArabic ? arabicFontFamily : englishFontFamily;
}
