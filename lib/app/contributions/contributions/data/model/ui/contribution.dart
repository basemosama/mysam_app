import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/types/contribution_type.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';

part 'types/idiom_contribution.dart';
part 'types/modern_meaning_contribution.dart';
part 'types/photo_contribution.dart';
part 'types/poem_contribution.dart';
part 'types/qa_contribution.dart';
part 'types/slang_contribution.dart';
part 'types/synonyms_contribution.dart';
part 'types/unknown_contribution.dart';

sealed class Contribution {
  // 1
  final int id;

  // g7s423kbj23qlpt9peeuwu6q
  final String documentId;

  // declined
  final ContributionStatus status;

  // موهوب
  final String relatedWord;

  // qa
  final ContributionType type;
  final Root? root;

  // 2024-09-11T09:03:19.200Z
  final DateTime? createdAt;

  // 2024-09-12T11:21:20.458Z
  final DateTime? updatedAt;

  // 2024-09-12T11:21:20.431Z
  final DateTime? publishedAt;

  const Contribution({
    required this.id,
    required this.documentId,
    required this.status,
    required this.relatedWord,
    required this.type,
    this.root,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });
}
