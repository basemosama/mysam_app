import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:playx/playx.dart';

class DarkColors extends AppColors {
  // static final ColorScheme scheme = SeedColorScheme.fromSeeds(
  //   primaryKey: Colors.black,
  //   brightness: Brightness.dark,
  //   tones: FlexTones.material(Brightness.dark)
  //       .onMainsUseBW()
  //       .onSurfacesUseBW()
  //       .surfacesUseBW(),
  // );

  static final ColorScheme scheme = SeedColorScheme.fromSeeds(
    primaryKey: AppColors.primaryKey,
    brightness: Brightness.dark,
    tones: FlexTones.material(Brightness.dark).onMainsUseBW().onSurfacesUseBW(),
    // .surfacesUseBW(),
  ).copyWith(
      // tertiary: Colors.grey[800],
      // primary: Colors.white,
      // secondary: Colors.grey[800],
      // surface: Colors.black,
      // onPrimary: Colors.black,
      // onSecondary: Colors.white,
      // onSurface: Colors.white,
      // outline: Colors.grey[400],
      // primaryContainer: Colors.white,
      );

  DarkColors() : super(colorScheme: scheme);

  @override
  Color get appBar => PlayxColors.black;

  @override
  Color? get subtitleTextColor => Colors.grey[400];

  @override
  Color? get chipBackgroundColor => Colors.grey[700];

  @override
  Color? get buttonBackgroundColor => PlayxColors.white;

  @override
  Color? get bottomBarUnselectedColor => Colors.grey[600];

  @override
  Color? get onButtonColor => PlayxColors.black;

  @override
  Color? get bottomBarShadowColor => Colors.transparent;

  @override
  Color get onAppBar => PlayxColors.white;

  @override
  Color? get onChipBackgroundColor => Colors.white;

  @override
  Color? get disabledButtonBackgroundColor => Colors.grey[600];

  @override
  Gradient? get backgroundGradient => null;

  @override
  Color get onBackgroundGradient => onSurface;

  @override
  Color get filledColor => const Color(0xFF6B6873);

  @override
  Color get pendingBackgroundColor => Colors.yellow[700]!;

  @override
  Color get confirmedBackgroundColor => Colors.green[700]!;

  @override
  Color get declinedBackgroundColor => Colors.red[700]!;

  @override
  Color get onPendingBackgroundColor => Colors.black;

  @override
  Color get onConfirmedBackgroundColor => Colors.white;

  @override
  Color get onDeclinedBackgroundColor => Colors.white;

  @override
  Color get primaryVariant => const Color(0XFFE8DEF8);

  @override
  Color get onPrimaryVariant => Colors.black;
}
