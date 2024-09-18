import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/core/models/media_item.dart';
import 'package:mysam_app/core/network/api_client.dart';
import 'package:mysam_app/core/network/endpoints/endpoints.dart';
import 'package:mysam_app/core/network/helper/api_helper.dart';
import 'package:playx/playx.dart';

class EditContributionDatasource {
  static final EditContributionDatasource _instance =
      EditContributionDatasource._internal();

  factory EditContributionDatasource() {
    return _instance;
  }

  EditContributionDatasource._internal();

  final _client = ApiClient.client;

  Future<NetworkResult<ApiContribution>> editContribution({
    required ApiContribution contribution,
  }) async {
    Map<String, dynamic> body;

    final image = contribution.image;
    if (image != null && image.documentId?.isEmpty == true) {
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

    return _client.put<ApiContribution>(
      Endpoints.editContributions(contribution.documentId),
      body: body,
      fromJson: ApiContribution.fromJson,
    );
  }
}
