import 'package:mysam_app/app/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/data/model/ui/idiom_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/modern_meaning_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/photo_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/poem_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/qa_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/slang_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/synonyms_contribution.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/ui/root.dart';

abstract class Contribution {
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

  static List<String> get availableContributions => [
        QAContribution.displayName,
        PoemContribution.displayName,
        IdiomContribution.displayName,
        SynonymsContribution.displayName,
        ModernMeaningContribution.displayName,
        SlangContribution.displayName,
        PhotoContribution.displayName,
      ];
}
