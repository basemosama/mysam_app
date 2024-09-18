import 'package:mysam_app/app/app_launch/auth/data/models/mapper/api_user_info_to_user_info_mapper.dart';
import 'package:mysam_app/app/app_launch/auth/data/models/ui/user_info.dart';
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

  UserInfo? get createdByUser => user?.toUserInfo();

  UserInfo? get reviewedByUser => reviewedBy?.toUserInfo();

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
      question: data?.question ?? '',
      answer: data?.answer ?? '',
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      body: data?.body ?? '',
      description: data?.description ?? '',
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      body: data?.body ?? '',
      description: data?.description ?? '',
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      image: image,
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      synonyms: data?.data ?? [],
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      modernMeanings: data?.data ?? [],
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      slangWords: data?.data ?? [],
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
      createdBy: createdByUser,
      reviewedBy: reviewedByUser,
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
          image: (this as PhotoContribution).image?.id,
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
      user: createdBy?.toApiUserInfo(),
      reviewedBy: reviewedBy?.toApiUserInfo(),
      data: data,
      image: (this is PhotoContribution)
          ? (this as PhotoContribution).image
          : null,
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      publishedAt: publishedAt?.toIso8601String(),
    );
  }
}
