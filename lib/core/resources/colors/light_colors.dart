import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:playx/playx.dart';

class LightColors extends AppColors {
  // static final ColorScheme scheme = Seedcontext.colors.fromSeeds(
  //   primaryKey:  AppColors.primaryKey,
  // );

  static final ColorScheme scheme = SeedColorScheme.fromSeeds(
    primaryKey: AppColors.primaryKey,
    tones: FlexTones.material(Brightness.light)
        .onMainsUseBW()
        .onSurfacesUseBW()
        .surfacesUseBW(),
  ).copyWith(
      // primary: Colors.black,
      // secondary: Colors.grey[800],
      // surface: Colors.white,
      // onPrimary: Colors.white,
      // onSecondary: Colors.white,
      // onSurface: Colors.black,
      // outline: Colors.grey[400],
      // primaryContainer: Colors.black,
      );

  LightColors() : super(colorScheme: scheme);

  @override
  Color get appBar => PlayxColors.white;

  @override
  Color? get chipBackgroundColor => Colors.grey;

  @override
  Color? get subtitleTextColor => const Color(0xFF808080);

  @override
  Color? get buttonBackgroundColor => primary;

  @override
  Color? get onButtonColor => PlayxColors.white;

  @override
  Color? get bottomBarUnselectedColor => const Color(0XFFAFAFAF);

  @override
  Color? get bottomBarShadowColor => Colors.grey[300];

  @override
  Color get onAppBar => PlayxColors.black;

  @override
  Color? get onChipBackgroundColor => Colors.white;

  @override
  Color? get disabledButtonBackgroundColor => Colors.grey[300];

  @override
  Gradient? get backgroundGradient => null;

  @override
  Color get onBackgroundGradient => onSurface;

  @override
  Color get filledColor => const Color(0xFFE5E5E5);

  @override
  Color get pendingBackgroundColor => const Color(0xFFFDE047);

  @override
  Color get confirmedBackgroundColor => const Color(0xFF22C55E);

  @override
  Color get declinedBackgroundColor => Colors.red[300]!;

  @override
  Color get onPendingBackgroundColor => Colors.black;

  @override
  Color get onConfirmedBackgroundColor => Colors.black;

  @override
  Color get onDeclinedBackgroundColor => Colors.black;

  @override
  Color get primaryVariant => const Color(0XFFE8DEF8);

  @override
  Color get onPrimaryVariant => Colors.black;
}
