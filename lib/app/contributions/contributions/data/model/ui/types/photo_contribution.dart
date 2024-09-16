part of '../contribution.dart';

class PhotoContribution extends Contribution {
  final String imageId;

  PhotoContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    required super.type,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    required this.imageId,
    super.root,
  });
}
