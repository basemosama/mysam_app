import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/related_word.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/types/contribution_type.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';
import 'package:mysam_app/core/models/media_item.dart';

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
  final ContributionRelatedWord relatedWord;

  final UserInfo? createdBy;
  final UserInfo? reviewedBy;

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
    required this.type,
    this.root,
    required this.relatedWord,
    this.createdBy,
    this.reviewedBy,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  String get title => switch (this) {
        QAContribution _ => (this as QAContribution).question,
        IdiomContribution _ => (this as IdiomContribution).body,
        PhotoContribution _ => (this as PhotoContribution).relatedWord.word,
        SlangContribution _ =>
          (this as SlangContribution).slangWords.join(', '),
        PoemContribution _ => (this as PoemContribution).body,
        SynonymsContribution _ =>
          (this as SynonymsContribution).synonyms.join(', '),
        ModernMeaningContribution _ =>
          (this as ModernMeaningContribution).modernMeanings.join(', '),
        UnknownContribution _ => (this as UnknownContribution).relatedWord.word,
      };
}
