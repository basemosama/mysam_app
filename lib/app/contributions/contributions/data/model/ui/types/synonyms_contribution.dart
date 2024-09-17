part of '../contribution.dart';

class SynonymsContribution extends Contribution {
  final List<String> synonyms;

  SynonymsContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.synonyms,
    super.root,
  }) : super(type: ContributionType.synonyms);
}
