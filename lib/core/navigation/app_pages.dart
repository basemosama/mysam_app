import 'package:mysam_app/app/app_launch/auth/ui/login/imports/login_imports.dart';
import 'package:mysam_app/app/app_launch/auth/ui/register/imports/register_imports.dart';
import 'package:mysam_app/app/app_launch/onboarding/ui/imports/onboarding_imports.dart';
import 'package:mysam_app/app/app_launch/splash/ui/imports/splash_imports.dart';
import 'package:mysam_app/app/contributions/ui/imports/contributions_imports.dart';
import 'package:mysam_app/app/home/ui/imports/home_imports.dart';
import 'package:mysam_app/app/profile/ui/imports/profile_imports.dart';
import 'package:mysam_app/app/settings/ui/imports/settings_imports.dart';
import 'package:mysam_app/core/navigation/app_routes.dart';
import 'package:mysam_app/core/navigation/navigation_utils.dart';
import 'package:mysam_app/core/widgets/navigation/custom_page.dart';
import 'package:playx/playx.dart';

/// contains all possible routes for the application.
class AppPages {
  AppPages._();

  static const initial = Paths.splash;

  static final router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    routes: routes,
    observers: [
      SentryNavigatorObserver(),
    ],
  );

  static final _homeNavigationRoutes = StatefulShellRoute.indexedStack(
    pageBuilder: (context, state, navigationShell) {
      return CustomPageScaffold.buildPage(
        state: state,
        navigationShell: navigationShell,
        showBottomNav: NavigationUtils.showBottomNav,
        canShowDrawer: NavigationUtils.canShowDrawer,
        canShowNavigationRail: NavigationUtils.showNavigationRail,
      );
    },
    branches: [
      StatefulShellBranch(
        routes: [
          PlayxRoute(
            path: Paths.home,
            name: Routes.home,
            builder: (ctx, state) => HomeView(),
            binding: HomeBinding(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          PlayxRoute(
            path: Paths.contributions,
            name: Routes.contributions,
            builder: (ctx, state) => const ContributionsView(),
            binding: ContributionsBinding(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          PlayxRoute(
            path: Paths.profile,
            name: Routes.profile,
            builder: (ctx, state) => const ProfileView(),
            binding: ProfileBinding(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          PlayxRoute(
            path: Paths.settings,
            name: Routes.settings,
            builder: (ctx, state) => const SettingsView(),
            binding: SettingsBinding(),
          ),
        ],
      ),
    ],
  );

  static final routes = [
    PlayxRoute(
      path: Paths.splash,
      name: Routes.splash,
      builder: (context, state) => const SplashView(),
      binding: SplashBinding(),
    ),
    PlayxRoute(
      path: Paths.login,
      name: Routes.login,
      builder: (context, state) => const LoginView(),
      binding: LoginBinding(),
    ),
    PlayxRoute(
      path: Paths.register,
      name: Routes.register,
      builder: (context, state) => const RegisterView(),
      binding: RegisterBinding(),
    ),
    PlayxRoute(
      path: Paths.onboarding,
      name: Routes.onboarding,
      builder: (context, state) => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    _homeNavigationRoutes,
  ];
}
