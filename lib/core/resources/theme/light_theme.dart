import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/light_colors.dart';
import 'package:mysam_app/core/resources/translation/app_locale_config.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:playx/playx.dart';

// ignore: avoid_classes_with_only_static_members
class LightTheme {
  static String lightThemeId = 'light';
  static String lightThemeNameKey = AppTrans.lightTheme;

  static LightColors colors = LightColors();

  static ThemeData _themeData({Locale? locale}) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          barBackgroundColor: const Color(0xF0F9F9F9),
          primaryColor: colors.primary,
          primaryContrastingColor: colors.primaryContainer,
          scaffoldBackgroundColor: colors.surface,
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
            primaryColor: CupertinoColors.label,
            tabLabelTextStyle: TextStyle(
              color: colors.subtitleTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        useMaterial3: true,
        colorScheme: colors.colorScheme,
        sliderTheme: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? TextStyle(
                    color: colors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )
                : TextStyle(
                    color: colors.subtitleTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
        fontFamily:
            locale?.isEnglish == true ? englishFontFamily : arabicFontFamily,
      );

  static XTheme get theme => XTheme.builder(
        id: lightThemeId,
        name: lightThemeNameKey,
        colors: colors,
        initialTheme: _themeData(),
        themeBuilder: (locale) => _themeData(locale: locale),
        cupertinoThemeBuilder: (locale) => MaterialBasedCupertinoThemeData(
          materialTheme: _themeData(locale: locale),
        ),
      );
}
