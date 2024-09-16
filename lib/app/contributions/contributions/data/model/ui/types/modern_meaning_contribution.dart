part of '../contribution.dart';

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
}
