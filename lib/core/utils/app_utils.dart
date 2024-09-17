//utils that will be used in the app
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/theme/dark_theme.dart';
import 'package:playx/playx.dart';
import 'package:timeago/timeago.dart' as timeago;

/// Class for app utilities that will be used in the app.
class AppUtils {
  AppUtils._();

  /// validates text field forms state and apply it to an RxBool
  static void validate(GlobalKey<FormState> key, RxBool validatorListener) {
    final formState = key.currentState;
    final isValid = formState != null && formState.validate();
    validatorListener.value = isValid;
  }

  static bool isDarkMode() {
    return PlayxTheme.id == DarkTheme.theme.id;
  }

  static bool isMobile() {
    final double width = ScreenUtil().screenWidth;
    final double height = ScreenUtil().screenHeight;
    final shortestSide = min(width.abs(), height.abs());
    return shortestSide < 600;
  }

  static String getFormattedTimeAgo({DateTime? time}) {
    if (time == null) {
      return '';
    }
    return timeago.format(time,
        locale: PlayxLocalization.currentLocale.toLanguageTag(),);
  }

  static void setupTimeAgoMessages() {
    timeago.setLocaleMessages(
      'ar',
      timeago.ArMessages(),
    );
    timeago.setLocaleMessages(
      'en',
      timeago.EnMessages(),
    );
  }
}

extension AppUtilsExtension on BuildContext {
  bool get isDarkMode => AppUtils.isDarkMode();
  bool get isTablet => mediaQuery.size.width >= 600;
}
