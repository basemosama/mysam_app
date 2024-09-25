import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/models/api_response.dart';
import 'package:playx/playx.dart';

class ReviewDetailsDatasource {
  static final ReviewDetailsDatasource _instance =
      ReviewDetailsDatasource._internal();

  factory ReviewDetailsDatasource() {
    return _instance;
  }

  ReviewDetailsDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiResponse<ApiContribution>>> getContribution({
    required String contributionId,
    CancelToken? cancelToken,
  }) {
    return _client.get(
      Endpoints.contributionDetails(contributionId),
      query: {
        'populate': '*',
      },
      fromJson: (json) => ApiResponse.fromJson(
        json: json,
        dataFromJson: ApiContribution.fromJson,
      ),
      cancelToken: cancelToken,
    );
  }

  //Accept contribution
  Future<NetworkResult<ApiResponse<ApiContribution>>> acceptContribution({
    required Contribution contribution,
  }) {
    return _client.put(
      Endpoints.confirmContribution(contribution.documentId),
      fromJson: (json) => ApiResponse.fromJson(
        json: json,
        dataKey: 'contribution',
        dataFromJson: ApiContribution.fromJson,
      ),
    );
  }

  //Reject contribution
  Future<NetworkResult<ApiResponse<ApiContribution>>> rejectContribution({
    required Contribution contribution,
  }) {
    return _client.put(
      Endpoints.declineContribution(contribution.documentId),
      fromJson: (json) => ApiResponse.fromJson(
        json: json,
        dataKey: 'contribution',
        dataFromJson: ApiContribution.fromJson,
      ),
    );
  }
}
