import 'package:mysam_app/app/app_launch/auth/ui/login/imports/login_imports.dart';
import 'package:mysam_app/app/app_launch/auth/ui/register/imports/register_imports.dart';
import 'package:mysam_app/app/app_launch/onboarding/ui/imports/onboarding_imports.dart';
import 'package:mysam_app/app/app_launch/splash/ui/imports/splash_imports.dart';
import 'package:mysam_app/app/contributions/contributions/ui/imports/contributions_imports.dart';
import 'package:mysam_app/app/contributions/create_contribution/ui/imports/create_contribution_imports.dart';
import 'package:mysam_app/app/home/roots/details/ui/imports/root_details_imports.dart';
import 'package:mysam_app/app/home/roots/roots/ui/imports/roots_imports.dart';
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
            builder: (ctx, state) => const RootsView(),
            binding: RootsBinding(),
            routes: [
              PlayxRoute(
                path: Paths.rootDetails,
                name: Routes.rootDetails,
                builder: (ctx, state) => const RootDetailsView(),
                binding: RootDetailsBinding(),
              ),
            ],
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
            routes: [
              PlayxRoute(
                path: Paths.createContribution,
                name: Routes.createContribution,
                builder: (ctx, state) => const CreateContributionView(),
                binding: CreateContributionBinding(),
              ),
            ],
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
          PlayxRoute(
            path: Paths.profile,
            name: Routes.profile,
            builder: (ctx, state) => const ProfileView(),
            binding: ProfileBinding(),
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
