import 'package:mysam_app/app/contributions/data/model/api/api_contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/app/contributions/data/model/ui/contribution_status.dart';

extension ApiContributionToContributionMapper on ApiContribution {
  Contribution toContribution() {
    return Contribution(
      id: id,
      documentId: documentId,
      status: ContributionStatus.fromString(contributionStatus),
      relatedWord: relatedWord,
      type: type,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
      publishedAt: publishedAt != null ? DateTime.parse(publishedAt!) : null,
    );
  }
}

extension ContributionToApiContributionMapper on Contribution {
  ApiContribution toApiContribution() {
    return ApiContribution(
      id: id,
      documentId: documentId,
      contributionStatus: status.toShortString(),
      relatedWord: relatedWord,
      type: type,
      data: Data(
        answer: null,
        question: null,
      ),
      createdAt: createdAt?.toIso8601String(),
      updatedAt: updatedAt?.toIso8601String(),
      publishedAt: publishedAt?.toIso8601String(),
    );
  }
}
