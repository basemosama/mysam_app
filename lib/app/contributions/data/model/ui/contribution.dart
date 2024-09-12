import 'package:mysam_app/app/contributions/data/model/ui/contribution_status.dart';

class Contribution {
  // 1
  final int id;
  // g7s423kbj23qlpt9peeuwu6q
  final String documentId;
  // declined
  final ContributionStatus status;
  // موهوب
  final String relatedWord;
  // qa
  final String type;
  // 2024-09-11T09:03:19.200Z
  final DateTime? createdAt;
  // 2024-09-12T11:21:20.458Z
  final DateTime? updatedAt;
  // 2024-09-12T11:21:20.431Z
  final DateTime? publishedAt;

  Contribution({
    required this.id,
    required this.documentId,
    required this.status,
    required this.relatedWord,
    required this.type,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
}
