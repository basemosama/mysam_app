import 'package:mysam_app/app/home/roots/roots/data/model/api/api_root.dart';
import 'package:playx/playx.dart';

class ApiContribution {
  // 1
  final int id;
  // g7s423kbj23qlpt9peeuwu6q
  final String documentId;
  // declined
  final String contributionStatus;
  // موهوب
  final String relatedWord;
  final ApiRoot? root;
  // qa
  final String type;
  final Data? data;
  // "relatedWordType": null,
  // "relatedWordTypeMeta": null,
  // "relatedWordWeight": null,
  // "metaData": null
  final String? relatedWordType;
  final String? relatedWordTypeMeta;
  final String? relatedWordWeight;
  final List<String>? metaData;

  // 2024-09-11T09:03:19.200Z
  final String? createdAt;
  // 2024-09-12T11:21:20.458Z
  final String? updatedAt;
  // 2024-09-12T11:21:20.431Z
  final String? publishedAt;

  ApiContribution({
    required this.id,
    required this.documentId,
    required this.contributionStatus,
    required this.relatedWord,
    required this.type,
    this.root,
    this.data,
    this.relatedWordType,
    this.relatedWordTypeMeta,
    this.relatedWordWeight,
    this.metaData,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory ApiContribution.fromJson(dynamic json) {
    final data = json['data'];
    Data? dataObj;
    if (data is List<String>) {
      dataObj = Data(data: data);
    } else if (data is Map<String, dynamic>) {
      dataObj = Data.fromJson(data);
    }

    return ApiContribution(
      id: asIntOrNull(json as Map<String, dynamic>, 'id')!,
      documentId: asStringOrNull(json, 'documentId')!,
      contributionStatus: asStringOrNull(json, 'contributionStatus')!,
      relatedWord: asStringOrNull(json, 'relatedWord')!,
      type: asStringOrNull(json, 'type')!,
      data: dataObj,
      root: json['root'] != null ? ApiRoot.fromJson(json['root']) : null,
      relatedWordType: asStringOrNull(json, 'relatedWordType'),
      relatedWordTypeMeta: asStringOrNull(json, 'relatedWordTypeMeta'),
      relatedWordWeight: asStringOrNull(json, 'relatedWordWeight'),
      metaData: asListStringOrNull(json, 'metaData'),
      createdAt: asStringOrNull(json, 'createdAt'),
      updatedAt: asStringOrNull(json, 'updatedAt'),
      publishedAt: asStringOrNull(json, 'publishedAt'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'documentId': documentId,
        'contributionStatus': contributionStatus,
        'relatedWord': relatedWord,
        'type': type,
        'data': data?.data != null ? data!.data : data?.toJson(),
        'root': root?.toJson(),
        'relatedWordType': relatedWordType,
        'relatedWordTypeMeta': relatedWordTypeMeta,
        'relatedWordWeight': relatedWordWeight,
        'metaData': metaData,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'publishedAt': publishedAt,
      };
}

class Data {
  // موهوب
  final String? answer;
  // موهوب
  final String? question;
  final String? body;
  final String? description;

  final String? image;
  final List<String>? data;

  Data({
    this.answer,
    this.question,
    this.body,
    this.description,
    this.image,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        answer: asStringOrNull(json, 'answer'),
        question: asStringOrNull(json, 'question'),
        body: asStringOrNull(json, 'body'),
        description: asStringOrNull(json, 'description'),
        image: asStringOrNull(json, 'image'),
        data: asListStringOrNull(json, 'data'),
      );

  Map<String, dynamic> toJson() => {
        if (answer != null) 'answer': answer,
        if (question != null) 'question': question,
        if (body != null) 'body': body,
        if (description != null) 'description': description,
        if (description != null) 'image': image,
      };
}
