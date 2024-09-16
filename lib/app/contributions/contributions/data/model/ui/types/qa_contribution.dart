part of '../contribution.dart';

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
}
