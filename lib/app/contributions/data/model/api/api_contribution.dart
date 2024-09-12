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
  // qa
  final String type;
  final Data? data;
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
    this.data,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory ApiContribution.fromJson(dynamic json) => ApiContribution(
        id: asIntOrNull(json as Map<String, dynamic>, 'id')!,
        documentId: asStringOrNull(json, 'documentId')!,
        contributionStatus: asStringOrNull(json, 'contributionStatus')!,
        relatedWord: asStringOrNull(json, 'relatedWord')!,
        type: asStringOrNull(json, 'type')!,
        data: Data.fromJson(asMap(json, 'data')),
        createdAt: asStringOrNull(json, 'createdAt'),
        updatedAt: asStringOrNull(json, 'updatedAt'),
        publishedAt: asStringOrNull(json, 'publishedAt'),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'documentId': documentId,
        'contributionStatus': contributionStatus,
        'relatedWord': relatedWord,
        'type': type,
        'data': data?.toJson(),
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

  Data({
    required this.answer,
    required this.question,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        answer: asStringOrNull(json, 'answer'),
        question: asStringOrNull(json, 'question'),
      );

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'question': question,
      };
}
