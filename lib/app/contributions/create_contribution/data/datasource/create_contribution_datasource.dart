import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:playx/playx.dart';

class CreateContributionDatasource {
  static final CreateContributionDatasource _instance =
      CreateContributionDatasource._internal();

  factory CreateContributionDatasource() {
    return _instance;
  }

  CreateContributionDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiContribution>> createContribution(
      {required ApiContribution contribution}) async {
    return _client.post<ApiContribution>(
      Endpoints.contribute,
      body: contribution.toJson(),
      fromJson: ApiContribution.fromJson,
    );
  }
}
