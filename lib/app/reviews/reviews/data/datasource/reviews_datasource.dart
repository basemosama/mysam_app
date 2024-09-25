import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/models/api_response.dart';
import 'package:playx/playx.dart';

class ReviewsDatasource {
  static final ReviewsDatasource _instance = ReviewsDatasource._internal();

  factory ReviewsDatasource() {
    return _instance;
  }

  ReviewsDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiResponse<List<ApiContribution>>>> getContributions({
    required int page,
    int pageSize = 25,
    String? search,
    ContributionStatus? status,
    CancelToken? cancelToken,
  }) async {
    final query = {
      'pagination[page]': page,
      'pagination[pageSize]': pageSize,
      if (search != null && search.isNotEmpty) 'filters[relatedWord]': search,
      // if (status != null && status != ContributionStatus.all)
      'filters[contributionStatus]': ContributionStatus.pending.toShortString(),
      'populate': '*',
      'sort': 'createdAt:desc',
    };

    return _client.get(
      Endpoints.contributions,
      query: query,
      fromJson: (json) => ApiResponse.createApiResponseFromJsonDataList(
        json: json,
        dataFromJson: ApiContribution.fromJson,
      ),
      cancelToken: cancelToken,
    );
  }
}
