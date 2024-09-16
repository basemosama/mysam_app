part of '../contribution.dart';

class SynonymsContribution extends Contribution {
  final List<String> synonyms;

  SynonymsContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    required super.type,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.synonyms,
    super.root,
  });
}
