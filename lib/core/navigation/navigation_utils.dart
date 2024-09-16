import 'package:flutter/cupertino.dart';
import 'package:mysam_app/core/navigation/app_pages.dart';
import 'package:mysam_app/core/navigation/app_routes.dart';
import 'package:mysam_app/core/utils/app_utils.dart';
import 'package:playx/playx.dart';

class NavigationUtils {
  NavigationUtils._();

  static List<String> get mainRoutes => [
        Routes.home,
        Routes.profile,
        Routes.contributions,
        Routes.settings,
      ];

  static List<String> get routesBottomNav => [
        Routes.home,
        Routes.profile,
        Routes.contributions,
        Routes.settings,
        Routes.rootDetails,
      ];

  static bool get showBottomNav =>
      routesBottomNav.contains(PlayxNavigation.currentRouteName);

  static bool get canShowDrawer => AppUtils.isMobile();

  static bool get showNavigationRail => !AppUtils.isMobile();

  static GlobalKey<NavigatorState> get navigatorKey =>
      AppPages.router.routerDelegate.navigatorKey;

  static BuildContext? get navigationContext => navigatorKey.currentContext;
}
