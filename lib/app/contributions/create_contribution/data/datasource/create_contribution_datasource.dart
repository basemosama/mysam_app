import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/core/models/media_item.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/helper/api_helper.dart';
import 'package:playx/playx.dart';

class CreateContributionDatasource {
  static final CreateContributionDatasource _instance =
      CreateContributionDatasource._internal();

  factory CreateContributionDatasource() {
    return _instance;
  }

  CreateContributionDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiContribution>> createContribution({
    required ApiContribution contribution,
  }) async {
    Map<String, dynamic> body;

    final image = contribution.image;
    if (image != null) {
      final uploadedImageRes =
          await ApiHelper.instance.uploadImage(image: image);
      if (uploadedImageRes is NetworkError<MediaItem>) {
        return NetworkError<ApiContribution>(uploadedImageRes.error);
      }

      body = contribution.toJson(
        image: (uploadedImageRes as NetworkSuccess<MediaItem>).data,
      );
    } else {
      body = contribution.toJson();
    }

    return _client.post<ApiContribution>(
      Endpoints.contribute,
      body: body,
      fromJson: ApiContribution.fromJson,
    );
  }
}
