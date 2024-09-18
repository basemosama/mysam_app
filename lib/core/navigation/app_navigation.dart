import 'package:mysam_app/app/contributions/contributions/data/model/ui/types/contribution_type.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';
import 'package:mysam_app/core/navigation/app_routes.dart';
import 'package:playx_navigation/playx_navigation.dart';

/// This class is responsible for handling the app navigation.
/// for each navigation from screen to another add it here.
abstract class AppNavigation {
  AppNavigation._();

  static void navigateFormSplashToHome() {
    PlayxNavigation.offAllNamed(Routes.home);
  }

  static void navigateFormSplashToLogin() {
    PlayxNavigation.offAllNamed(Routes.login);
  }

  static void navigateFromLoginToRegister() {
    PlayxNavigation.toNamed(Routes.register);
  }

  static void navigateFromLoginToHome() {
    PlayxNavigation.offAllNamed(Routes.home);
  }

  static void navigateFromRegisterToLogin() {
    PlayxNavigation.offAllNamed(Routes.login);
  }

  static void navigateFromRegisterToHome() {
    PlayxNavigation.offAllNamed(Routes.home);
  }

  static void navigateToSplash() {
    PlayxNavigation.offAllNamed(Routes.splash);
  }

  static void navigateFromSplashToOnBoarding() {
    PlayxNavigation.offAllNamed(Routes.onboarding);
  }

  static void navigateFromOnBoardingToLogin() {
    PlayxNavigation.offAllNamed(Routes.login);
  }

  static void navigateFromSettingsToLogin() {
    PlayxNavigation.offAllNamed(Routes.login);
  }

  static void navigateToLogin() {
    PlayxNavigation.offAllNamed(Routes.login);
  }

  static void navigateToRootDetails(Root root) {
    PlayxNavigation.toNamed(
      Routes.rootDetails,
      extra: root,
      pathParameters: {'id': root.documentId},
    );
  }

  static void navigateToContributions() {
    PlayxNavigation.toNamed(Routes.contributions);
  }

  static void navigateToCreateContribution({
    required Root root,
    required ContributionType type,
  }) {
    PlayxNavigation.toNamed(Routes.createContribution,
        extra: [root, type], pathParameters: {'id': root.documentId});
  }
}
