import 'package:mysam_app/app/home/roots/roots/data/model/api/api_root.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/models/api_response.dart';
import 'package:playx/playx.dart';

class RootDetailsDatasource {
  static final RootDetailsDatasource _instance =
      RootDetailsDatasource._internal();

  factory RootDetailsDatasource() {
    return _instance;
  }

  RootDetailsDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiResponse<ApiRoot>>> getRootDetails(
      String documentId) async {
    final query = {
      'populate[contributions][populate][0]': 'user',
      'populate[contributions][populate][1]': 'image',
    };

    return _client.get(
      Endpoints.rootDetails(documentId),
      query: query,
      fromJson: (json) => ApiResponse.fromJson(
        json: json,
        dataFromJson: ApiRoot.fromJson,
      ),
    );
  }
}
