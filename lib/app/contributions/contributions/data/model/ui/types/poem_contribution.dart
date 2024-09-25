part of '../contribution.dart';

class PoemContribution extends Contribution {
  final String body;
  final String? description;

  const PoemContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdBy,
    super.reviewedBy,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.body,
    this.description,
    super.root,
  }) : super(type: ContributionType.poem);
}
