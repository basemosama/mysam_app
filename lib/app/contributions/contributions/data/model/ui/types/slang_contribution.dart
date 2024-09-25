part of '../contribution.dart';

class SlangContribution extends Contribution {
  final List<String> slangWords;

  SlangContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdBy,
    super.reviewedBy,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.slangWords,
    super.root,
  }) : super(type: ContributionType.slang);
}
