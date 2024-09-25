import 'package:mysam_app/app/contributions/contributions/data/model/mapper/api_contribution_to_contribution_mapper.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/edit_contribution/data/datasource/edit_contribution_datasource.dart';
import 'package:mysam_app/core/network/helper/api_helper.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class EditContributionRepository {
  static final EditContributionRepository _instance =
      EditContributionRepository._internal();

  factory EditContributionRepository() {
    return _instance;
  }

  EditContributionRepository._internal();

  final _datasource = EditContributionDatasource();

  Future<NetworkResult<Contribution>> editContribution({
    required Contribution contribution,
  }) async {
    try {
      final con =
          await contribution.mapAsyncInIsolate((e) => e.toApiContribution());
      final res = await _datasource.editContribution(contribution: con);
      return res.mapDataAsyncInIsolate(
        mapper: (e) => NetworkSuccess(e.toContribution()),
      );
    } catch (e) {
      return ApiHelper.unableToProcessError();
    }
  }
}
