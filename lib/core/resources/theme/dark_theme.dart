import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/dark_colors.dart';
import 'package:mysam_app/core/resources/translation/app_locale_config.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:playx/playx.dart';

// ignore: avoid_classes_with_only_static_members
class DarkTheme {
  static String darkThemeId = 'dark';
  static String darkThemeName = AppTrans.darkTheme;

  static DarkColors colors = DarkColors();

  static ThemeData _themeData({Locale? locale}) => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          // backgroundColor: colors.appBar,
        ),
        useMaterial3: true,
        colorScheme: colors.colorScheme,
        sliderTheme: const SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          barBackgroundColor: const Color(0xF0090909),
          primaryColor: colors.primary,
          primaryContrastingColor: colors.primaryContainer,
          scaffoldBackgroundColor: colors.surface,
          brightness: Brightness.dark,
          textTheme: CupertinoTextThemeData(
            primaryColor: colors.primary,
            tabLabelTextStyle: TextStyle(
              color: colors.subtitleTextColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
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
        applyElevationOverlayColor: true,
        extensions: const [
          WoltModalSheetThemeData(
            modalElevation: 4,
          ),
        ],
        fontFamily:
            locale?.isEnglish == true ? englishFontFamily : arabicFontFamily,
      );

  static XTheme get theme => XTheme.builder(
        id: darkThemeId,
        name: darkThemeName,
        colors: DarkColors(),
        initialTheme: _themeData(),
        themeBuilder: (locale) => _themeData(locale: locale),
        cupertinoThemeBuilder: (locale) => MaterialBasedCupertinoThemeData(
            materialTheme: _themeData(locale: locale),),
        isDark: true,
      );
}
