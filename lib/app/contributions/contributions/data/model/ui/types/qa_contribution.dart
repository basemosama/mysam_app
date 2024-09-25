part of '../contribution.dart';

class QAContribution extends Contribution {
  final String question;
  final String answer;

  const QAContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdBy,
    super.reviewedBy,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.question,
    required this.answer,
    super.root,
  }) : super(type: ContributionType.qa);
}
