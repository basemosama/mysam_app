import 'package:mysam_app/app/home/roots/details/data/datasource/root_details_datasource.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/mapper/api_root_to_root_mapper.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';
import 'package:mysam_app/core/network/helper/api_helper.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class RootDetailsRepository {
  static final RootDetailsRepository _instance =
      RootDetailsRepository._internal();

  factory RootDetailsRepository() {
    return _instance;
  }

  RootDetailsRepository._internal();

  final _datasource = RootDetailsDatasource();

  Future<NetworkResult<Root>> getRootDetails(String documentId) async {
    try {
      final res = await _datasource.getRootDetails(documentId);
      return res.mapDataAsyncInIsolate(
        mapper: (data) {
          final root = data.data.toRoot();
          return NetworkResult.success(root);
        },
      );
    } catch (e) {
      return ApiHelper.unableToProcessError();
    }
  }
}
