// ignore_for_file: constant_identifier_names

/// app routes names.
abstract class Routes {
  static const splash = 'splash';
  static const login = 'login';
  static const register = 'register';
  static const onboarding = 'onboarding';
  static const settings = 'settings';
  static const home = 'home';
  static const rootDetails = 'rootDetails';
  static const contributions = 'contributions';
  static const myContributions = 'myContributions';

  static const createContribution = 'createContribution';
  static const profile = 'profile';

  static const editContribution = 'editContribution';
  static const reviews = 'reviews';
}

/// app routes paths.
abstract class Paths {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const onboarding = '/onboarding';
  static const settings = 'settings';
  static const rootDetails = 'roots/:id';
  static const home = '/home';
  static const contributions = '/contributions';
  static const myContributions = '/my-contributions';
  static const reviews = '/reviews';

  static const createContribution = 'create';
  static const editContribution = 'edit/:id';
  static const profile = '/profile';
}
