/// contains network endpoints.
abstract class Endpoints {
  const Endpoints._();

  static const baseUrl =
      "https://mysam-service-545469892583.europe-west1.run.app/api";

  /// `POST`
  static const loginViaAuth0 = '/auth/auth0/callback';
  static const login = '/auth/local';
  static const register = '/auth/local/register';
  static const upload = '/upload';

  static const profile = '/users/me';
  static const updateUser = '/users/edit-profile';

//   *****
//   confirm and decline contributinos
//   PUT  /contributions/:id/confirm
//   PUT  /contributions/:id/decline
//
  static const roots = '/roots';
  static String rootDetails(String documentId) => '$roots/$documentId';
  static const contribute = '/contributions/contribute';
  static const contributions = '/contributions';

  static const myContributions = '/my-contributions';

  static String confirmContribution(String documentId) =>
      '/contributions/$documentId/confirm';

  static String declineContribution(String documentId) =>
      '/contributions/$documentId/decline';
}
