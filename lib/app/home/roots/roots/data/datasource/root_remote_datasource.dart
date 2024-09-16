import 'package:mysam_app/app/home/roots/roots/data/model/api/api_root.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/models/api_response.dart';
import 'package:playx/playx.dart';

class RootRemoteDatasource {
  static final RootRemoteDatasource _instance =
      RootRemoteDatasource._internal();

  factory RootRemoteDatasource() {
    return _instance;
  }

  RootRemoteDatasource._internal();

  final _client = ApiClient.client;

  CancelToken? _getRootsCancelToken;

  Future<NetworkResult<ApiResponse<List<ApiRoot>>>> getRoots({
    required int page,
    String? searchText,
  }) async {
    final Map<String, dynamic> query = {
      'pagination[page]': page,
      'pagination[pageSize]': 25,
      'populate': '*',
      'sort[0]': 'value:asc',
    };
    if (searchText?.isNotEmpty == true) {
      query['filters[\$or][0][value][\$startsWith]'] = searchText;
    }

    _getRootsCancelToken?.cancel();
    _getRootsCancelToken = CancelToken();
    return _client.get(
      Endpoints.roots,
      query: query,
      cancelToken: _getRootsCancelToken,
      fromJson: (json) => ApiResponse.createApiResponseFromJsonDataList(
        json: json,
        dataFromJson: ApiRoot.fromJson,
      ),
    );
  }
}
