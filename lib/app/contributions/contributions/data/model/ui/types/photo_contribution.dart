part of '../contribution.dart';

class PhotoContribution extends Contribution {
  final MediaItem? image;

  PhotoContribution({
    required super.id,
    required super.documentId,
    required super.status,
    required super.relatedWord,
    super.createdAt,
    super.updatedAt,
    super.publishedAt,
    this.image,
    super.root,
  }) : super(type: ContributionType.photo);
}
