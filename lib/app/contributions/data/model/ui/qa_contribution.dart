import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';

class QAContribution extends Contribution {
  final String question;
  final String answer;

  const QAContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    required super.type,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.question,
    required this.answer,
    super.root,
  });

  static String get displayName => AppTrans.qaContribution;
}
