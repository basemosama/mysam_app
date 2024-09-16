part of '../contribution.dart';

class UnknownContribution extends Contribution {
  UnknownContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    required super.type,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    super.root,
  });
}
