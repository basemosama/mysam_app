import 'package:mysam_app/app/contributions/contributions/data/model/mapper/api_contribution_to_contribution_mapper.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/create_contribution/data/datasource/create_contribution_datasource.dart';
import 'package:mysam_app/core/utils/mapper_utilites.dart';
import 'package:playx/playx.dart';

class CreateContributionRepository {
  static final CreateContributionRepository _instance =
      CreateContributionRepository._internal();

  factory CreateContributionRepository() {
    return _instance;
  }

  CreateContributionRepository._internal();

  final _datasource = CreateContributionDatasource();

  Future<NetworkResult<Contribution>> createContribution({
    required Contribution contribution,
  }) async {
    final con =
        await contribution.mapAsyncInIsolate((e) => e.toApiContribution());
    final res = await _datasource.createContribution(contribution: con);
    return res.mapDataAsyncInIsolate(
      mapper: (e) => NetworkSuccess(e.toContribution()),
    );
  }
}
