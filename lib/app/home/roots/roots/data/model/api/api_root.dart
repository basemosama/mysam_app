import 'package:playx/playx.dart';

class ApiRoot {
  // 1
  final int id;
  // xgodm5tz6yrcoccy5n9czjis
  final String documentId;
  // وهب
  final String value;
  // raw
  final String rootStatus;
  // 2024-09-11T09:01:34.517Z
  final String? createdAt;
  // 2024-09-11T09:01:34.517Z
  final String? updatedAt;
  // 2024-09-11T09:01:34.492Z
  final String? publishedAt;

  ApiRoot({
    required this.id,
    required this.documentId,
    required this.value,
    required this.rootStatus,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory ApiRoot.fromJson(dynamic json) => ApiRoot(
        id: asIntOrNull(json as Map<String, dynamic>, 'id')!,
        documentId: asStringOrNull(json, 'documentId')!,
        value: asStringOrNull(json, 'value')!,
        rootStatus: asStringOrNull(json, 'rootStatus')!,
        createdAt: asStringOrNull(json, 'createdAt'),
        updatedAt: asStringOrNull(json, 'updatedAt'),
        publishedAt: asStringOrNull(json, 'publishedAt'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'documentId': documentId,
        'value': value,
        'rootStatus': rootStatus,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'publishedAt': publishedAt,
      };
}
