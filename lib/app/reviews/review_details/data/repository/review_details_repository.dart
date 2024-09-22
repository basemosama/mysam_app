import 'package:mysam_app/app/contributions/contributions/data/model/mapper/api_contribution_to_contribution_mapper.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/reviews/review_details/data/datasource/review_details_datasource.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class ReviewDetailsRepository {
  static final ReviewDetailsRepository _instance =
      ReviewDetailsRepository._internal();

  factory ReviewDetailsRepository() {
    return _instance;
  }

  ReviewDetailsRepository._internal();

  final _datasource = ReviewDetailsDatasource();

  Future<NetworkResult<Contribution>> getContribution({
    required Contribution contribution,
    CancelToken? cancelToken,
  }) async {
    final res = await _datasource.getContribution(
      contributionId: contribution.documentId,
      cancelToken: cancelToken,
    );
    return res.mapDataAsyncInIsolate(
      mapper: (response) async {
        return NetworkSuccess(response.data.toContribution());
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
        return NetworkSuccess(response.data.toContribution());
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
        return NetworkSuccess(response.data.toContribution());
      },
    );
  }
}
