import 'package:mysam_app/app/contributions/contributions/data/model/mapper/api_contribution_to_contribution_mapper.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/edit_contribution/data/repository/edit_contribution_repository.dart';
import 'package:mysam_app/app/reviews/reviews/data/datasource/reviews_datasource.dart';
import 'package:mysam_app/core/models/data_wrapper.dart';
import 'package:mysam_app/core/models/mapper/api_response_to_data_wrapper.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class ReviewsRepository {
  static final ReviewsRepository _instance = ReviewsRepository._internal();

  factory ReviewsRepository() {
    return _instance;
  }

  ReviewsRepository._internal();

  final _datasource = ReviewsDatasource();
  final _editContributionRepository = EditContributionRepository();

  Future<NetworkResult<DataWrapper<List<Contribution>>>> getContributions({
    required int page,
    int pageSize = 25,
    String? search,
    ContributionStatus? status,
    CancelToken? cancelToken,
  }) async {
    final res = await _datasource.getContributions(
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

  Future<NetworkResult<Contribution>> acceptContribution({
    required Contribution contribution,
  }) async {
    final res = await _datasource.acceptContribution(
      contribution: contribution,
    );
    return res.mapDataAsyncInIsolate(
      mapper: (response) async {
        return NetworkSuccess(response.toContribution());
      },
    );
  }

  Future<NetworkResult<Contribution>> rejectContribution({
    required Contribution contribution,
  }) async {
    final res = await _datasource.rejectContribution(
      contribution: contribution,
    );
    return res.mapDataAsyncInIsolate(
      mapper: (response) async {
        return NetworkSuccess(response.toContribution());
      },
    );
  }

  Future<NetworkResult<Contribution>> editContribution({
    required Contribution contribution,
  }) async {
    return _editContributionRepository.editContribution(
      contribution: contribution,
    );
  }
}
