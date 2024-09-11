import 'package:mysam_app/core/resources/theme/custom_blue_purple_gradient_theme.dart';
import 'package:mysam_app/core/resources/theme/custom_gradient_theme.dart';
import 'package:mysam_app/core/resources/theme/dark_theme.dart';
import 'package:mysam_app/core/resources/theme/light_theme.dart';
import 'package:playx/playx.dart';

PlayxThemeConfig createThemeConfig() => PlayxThemeConfig(
      themes: [
        LightTheme.theme,
        DarkTheme.theme,
        CustomGradientTheme.theme,
        CustomBluePurpleGradientTheme.theme,
      ],
      initialThemeIndex: PlayxTheme.isDeviceInDarkMode() ? 1 : 0,
    );
