import 'package:mysam_app/app/contributions/contributions/data/model/mapper/api_contribution_to_contribution_mapper.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/my_contributions/data/datasource/my_contributions_datasource.dart';
import 'package:mysam_app/core/models/data_wrapper.dart';
import 'package:mysam_app/core/models/mapper/api_response_to_data_wrapper.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class MyContributionsRepository {
  static final MyContributionsRepository _instance =
      MyContributionsRepository._internal();

  factory MyContributionsRepository() {
    return _instance;
  }

  MyContributionsRepository._internal();

  final _datasource = MyContributionsDatasource();

  Future<NetworkResult<DataWrapper<List<Contribution>>>> getMyContributions({
    required int page,
    int pageSize = 25,
    String? search,
    ContributionStatus? status,
    CancelToken? cancelToken,
  }) async {
    final res = await _datasource.getMyContributions(
      page: page,
      pageSize: pageSize,
      search: search,
      status: status,
      cancelToken: cancelToken,
    );
    return res.mapDataAsyncInIsolate(
      mapper: (response) async {
        final contributions = response.toDataWrapperAndMapData(
          mapper: (data) => data.map((e) => e.toContribution()).toList(),
        );
        return NetworkSuccess(contributions);
      },
    );
  }
}
