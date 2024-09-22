import 'package:mysam_app/core/network/models/api_meta.dart';
import 'package:playx/playx.dart';

class ApiResponse<T> {
  final T data;
  final ApiMeta? meta;
  final String? message;

  ApiResponse({
    required this.data,
    this.meta,
    this.message,
  });

  factory ApiResponse.fromJson({
    dynamic json,
    required T Function(dynamic) dataFromJson,
    String dataKey = 'data',
  }) {
    final map = json as Map<String, dynamic>;
    Fimber.d('Data: :${map[dataKey]}');
    final data = dataFromJson(map[dataKey]);

    return ApiResponse(
      data: data,
      meta: json['meta'] != null ? ApiMeta.fromJson(asMap(json, 'meta')) : null,
      message: asStringOrNull(json, 'message'),
    );
  }

  static ApiResponse<List<T>> createApiResponseFromJsonDataList<T>({
    dynamic json,
    required T Function(dynamic) dataFromJson,
    String dataKey = 'data',
  }) {
    final map = json as Map<String, dynamic>;
    final data = asList(map, dataKey).map((e) => dataFromJson(e)).toList();

    return ApiResponse(
      data: data,
      meta: json['meta'] != null ? ApiMeta.fromJson(asMap(json, 'meta')) : null,
      message: asStringOrNull(json, 'message'),
    );
  }

  Map<String, dynamic> toJson({
    required Map<String, dynamic> Function(T data) toDataJson,
  }) =>
      {
        'data': toDataJson(data),
        if (meta != null) 'meta': meta?.toJson(),
      };

  Future<Map<String, dynamic>> toJsonAsync({
    required Future<Map<String, dynamic>> Function(T data) toDataJson,
  }) async =>
      {
        'data': await toDataJson(data),
        if (meta != null) 'meta': meta?.toJson(),
      };

  Map<String, dynamic> toJsonList({
    required List<Map<String, dynamic>> Function(T data) toDataJson,
  }) =>
      {
        'data': toDataJson(data),
        if (meta != null) 'meta': meta?.toJson(),
      };
}
