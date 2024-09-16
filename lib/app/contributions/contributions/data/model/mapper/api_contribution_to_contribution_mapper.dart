import 'package:mysam_app/app/contributions/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_related_word_type.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/related_word.dart';
import 'package:mysam_app/app/contributions/contributions/data/model/ui/types/contribution_type.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/mapper/api_root_to_root_mapper.dart';

extension ApiContributionToContributionMapper on ApiContribution {
  DateTime? get contributionCreatedAt =>
      createdAt != null ? DateTime.tryParse(createdAt!) : null;
  DateTime? get contributionUpdatedAt =>
      updatedAt != null ? DateTime.tryParse(updatedAt!) : null;
  DateTime? get contributionPublishedAt =>
      publishedAt != null ? DateTime.tryParse(publishedAt!) : null;

  ContributionRelatedWord get relatedWordObj => ContributionRelatedWord(
        word: relatedWord,
        type: ContributionRelatedWordType.fromString(relatedWordType),
        typeMeta: relatedWordTypeMeta,
        weight: relatedWordWeight,
        metadata: metaData,
      );

  Contribution toContribution() {
    final type = ContributionType.fromString(this.type);
    switch (type) {
      case ContributionType.qa:
        return toQAContribution();
      case ContributionType.poem:
        return toPoemContribution();
      case ContributionType.idiom:
        return toIdiomContribution();
      case ContributionType.photo:
        return toPhotoContribution();
      case ContributionType.synonyms:
        return toSynonymsContribution();
      case ContributionType.modernMeaning:
        return toModernMeaningContribution();
      case ContributionType.slang:
        return toSlangContribution();
      default:
        return toUnknownContribution();
    }
  }

  QAContribution toQAContribution() {
    return QAContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.qa,
      question: data?.question ?? '',
      answer: data?.answer ?? '',
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  PoemContribution toPoemContribution() {
    return PoemContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.poem,
      body: data?.body ?? '',
      description: data?.description ?? '',
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  IdiomContribution toIdiomContribution() {
    return IdiomContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.idiom,
      body: data?.body ?? '',
      description: data?.description ?? '',
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  PhotoContribution toPhotoContribution() {
    return PhotoContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.photo,
      imageId: data?.image ?? '',
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  SynonymsContribution toSynonymsContribution() {
    return SynonymsContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.synonyms,
      synonyms: data?.data ?? [],
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  ModernMeaningContribution toModernMeaningContribution() {
    return ModernMeaningContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.modernMeaning,
      modernMeanings: data?.data ?? [],
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  SlangContribution toSlangContribution() {
    return SlangContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.slang,
      slangWords: data?.data ?? [],
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }

  UnknownContribution toUnknownContribution() {
    return UnknownContribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWordObj,
      type: ContributionType.unknown,
      createdAt: contributionCreatedAt,
      updatedAt: contributionUpdatedAt,
      publishedAt: contributionPublishedAt,
    );
  }
}

extension ContributionToApiContributionMapper on Contribution {
  ApiContribution toApiContribution() {
    Data? data;
    switch (this) {
      case QAContribution _:
        data = Data(
          question: (this as QAContribution).question,
          answer: (this as QAContribution).answer,
        );
      case PoemContribution _:
        data = Data(
          body: (this as PoemContribution).body,
          description: (this as PoemContribution).description,
        );
      case IdiomContribution _:
        data = Data(
          body: (this as IdiomContribution).body,
          description: (this as IdiomContribution).description,
        );
      case PhotoContribution _:
        data = Data(
          image: (this as PhotoContribution).imageId,
        );
      case SynonymsContribution _:
        data = Data(
          data: (this as SynonymsContribution).synonyms,
        );
      case ModernMeaningContribution _:
        data = Data(
          data: (this as ModernMeaningContribution).modernMeanings,
        );
      case SlangContribution _:
        data = Data(
          data: (this as SlangContribution).slangWords,
        );
      default:
        data = null;
    }

    return ApiContribution(
      id: id,
      documentId: documentId,
      contributionStatus: status.toShortString(),
      relatedWord: relatedWord.word,
      relatedWordType: relatedWord.type?.toShortString(),
      relatedWordWeight: relatedWord.weight,
      relatedWordTypeMeta: relatedWord.typeMeta,
      metaData: relatedWord.metadata,
      root: root?.toApiRoot(),
      type: type.toShortString(),
      data: data,
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      publishedAt: publishedAt?.toIso8601String(),
    );
  }
}
