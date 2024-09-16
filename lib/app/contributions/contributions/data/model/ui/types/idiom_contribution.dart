part of '../contribution.dart';

class IdiomContribution extends Contribution {
  final String body;
  final String? description;

  IdiomContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.body,
    this.description,
    super.root,
  }) : super(type: ContributionType.idiom);
}
