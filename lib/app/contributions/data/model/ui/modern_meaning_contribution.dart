import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';

class ModernMeaningContribution extends Contribution {
  final List<String> modernMeanings;

  ModernMeaningContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    required super.type,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.modernMeanings,
    super.root,
  });

  static String get displayName => AppTrans.modernMeaningContribution;
}
