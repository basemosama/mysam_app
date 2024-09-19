import 'package:mysam_app/core/network/api_client.dart';

class ContributionsDatasource {
  static final ContributionsDatasource _instance =
      ContributionsDatasource._internal();

  factory ContributionsDatasource() {
    return _instance;
  }

  ContributionsDatasource._internal();

  final _client = ApiClient.client;
}
