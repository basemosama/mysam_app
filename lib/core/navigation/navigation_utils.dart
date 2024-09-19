import 'package:flutter/cupertino.dart';
import 'package:mysam_app/core/navigation/app_pages.dart';
import 'package:mysam_app/core/navigation/app_routes.dart';
import 'package:playx/playx.dart';

class NavigationUtils {
  NavigationUtils._();

  static List<String> get mainRoutes => [
        Routes.home,
        Routes.profile,
        Routes.contributions,
        Routes.settings,
      ];

  static List<String> get routesWithoutBottomNav => [
        Routes.splash,
        Routes.onboarding,
        Routes.login,
        Routes.register,
      ];

  static bool get showBottomNav =>
      !routesWithoutBottomNav.contains(PlayxNavigation.currentRouteName);

  static bool get canShowDrawer => false;

  static bool get showNavigationRail => false;

  static GlobalKey<NavigatorState> get navigatorKey =>
      AppPages.router.routerDelegate.navigatorKey;

  static BuildContext? get navigationContext => navigatorKey.currentContext;
}
