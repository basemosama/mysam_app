import 'package:mysam_app/app/home/roots/roots/data/datasource/root_remote_datasource.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/mapper/api_root_to_root_mapper.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';
import 'package:mysam_app/core/models/data_wrapper.dart';
import 'package:mysam_app/core/models/mapper/api_response_to_data_wrapper.dart';
import 'package:mysam_app/core/utils/mapper_utilities.dart';
import 'package:playx/playx.dart';

class RootsRepository {
  static final RootsRepository _instance = RootsRepository._internal();

  factory RootsRepository() {
    return _instance;
  }

  RootsRepository._internal();

  final _remoteRootsDatasource = RootRemoteDatasource();

  Future<NetworkResult<DataWrapper<List<Root>>>> getRoots({
    required int page,
    String? searchText,
  }) async {
    final res = await _remoteRootsDatasource.getRoots(
      page: page,
      searchText: searchText,
    );

    return res.mapDataAsyncInIsolate(
      mapper: (apiRootsResponse) async => NetworkSuccess(
        DataWrapper(
          data: apiRootsResponse.data.toRootList(),
          pagination: apiRootsResponse.meta?.toPageInfo(),
        ),
      ),
    );
  }
}
