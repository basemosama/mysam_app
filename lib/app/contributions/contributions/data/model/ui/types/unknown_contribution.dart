part of '../contribution.dart';

class UnknownContribution extends Contribution {
  UnknownContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdBy,
    super.reviewedBy,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    super.root,
  }) : super(type: ContributionType.unknown);
}
