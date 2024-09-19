import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_user_info_to_user_info_mapper.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/models/api_response.dart';
import 'package:mysam_app/core/preferences/preference_manger.dart';
import 'package:playx/playx.dart';

class MyContributionsDatasource {
  static final MyContributionsDatasource _instance =
      MyContributionsDatasource._internal();

  factory MyContributionsDatasource() {
    return _instance;
  }

  MyContributionsDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiResponse<List<ApiContribution>>>> getMyContributions({
    required int page,
    int pageSize = 25,
    String? search,
    ContributionStatus? status,
    CancelToken? cancelToken,
  }) async {
    final query = {
      'page': page,
      'pageSize': pageSize,
      if (status != null && status != ContributionStatus.all)
        'filters[contributionStatus]': status.toShortString(),
      'populate': '*',
    };

    final user =
        (await MyPreferenceManger.instance.getSavedUser())?.toApiUserInfo();

    return _client.get(
      Endpoints.myContributions,
      query: query,
      fromJson: (json) => ApiResponse.fromJson(
        json: json,
        dataFromJson: (data) => (data['contributions'] as List)
            .map((e) => ApiContribution.fromJson(e, user: user))
            .toList(),
      ),
      cancelToken: cancelToken,
    );
  }
}
