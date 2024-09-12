import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';

class PoemContribution extends Contribution {
  final String body;
  final String? description;

  PoemContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    required super.type,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.body,
    this.description,
    super.root,
  });

  static String get displayName => AppTrans.poemContribution;
}
