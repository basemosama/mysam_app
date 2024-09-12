import 'package:mysam_app/app/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/contribution_status.dart';
import 'package:mysam_app/app/contributions/data/model/ui/idiom_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/modern_meaning_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/photo_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/poem_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/qa_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/slang_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/synonyms_contribution.dart';
import 'package:mysam_app/app/home/roots/roots/data/model/mapper/api_root_to_root_mapper.dart';

extension ApiContributionToContributionMapper on ApiContribution {
  Contribution toContribution() {
    // type: 	'qa' | 'poem' | 'idiom' | 'synonyms' | 'modern-meaning' | 'slang' | 'photo',
    switch (type) {
      case 'qa':
        return QAContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          question: data?.question ?? '',
          answer: data?.answer ?? '',
          root: root?.toRoot(),
        );
      case 'poem':
        return PoemContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          body: data?.body ?? '',
          description: data?.description,
          root: root?.toRoot(),
        );
      case 'idiom':
        return IdiomContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          body: data?.body ?? '',
          description: data?.description,
          root: root?.toRoot(),
        );
      case 'photo':
        return PhotoContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          imageId: data?.image ?? '',
          root: root?.toRoot(),
        );
      case 'synonyms':
        return SynonymsContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          synonyms: data?.data ?? [],
          root: root?.toRoot(),
        );
      case 'modern-meaning':
        return ModernMeaningContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          modernMeanings: data?.data ?? [],
          root: root?.toRoot(),
        );
      case 'slang':
        return SlangContribution(
          id: id,
          documentId: documentId,
          status: ContributionStatus.fromString(contributionStatus),
          relatedWord: relatedWord,
          type: type,
          createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
          updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
          publishedAt:
              publishedAt != null ? DateTime.parse(publishedAt!) : null,
          slangWords: data?.data ?? [],
          root: root?.toRoot(),
        );

      default:
        throw Exception('Unknown contribution type: $type');
    }
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
    }

    return ApiContribution(
      id: id,
      documentId: documentId,
      contributionStatus: status.toShortString(),
      relatedWord: relatedWord,
      type: type,
      data: data,
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      publishedAt: publishedAt?.toIso8601String(),
    );
  }
}
