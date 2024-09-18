import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';

enum ContributionStatus {
  all,
  pending,
  confirmed,
  declined;

  static ContributionStatus fromString(String status) {
    switch (status) {
      case 'all':
        return ContributionStatus.all;
      case 'pending':
        return ContributionStatus.pending;
      case 'confirmed':
        return ContributionStatus.confirmed;
      case 'declined':
        return ContributionStatus.declined;
      default:
        throw Exception('Unknown contribution status: $status');
    }
  }

  String toShortString() {
    switch (this) {
      case ContributionStatus.all:
        return 'all';
      case ContributionStatus.pending:
        return 'pending';
      case ContributionStatus.confirmed:
        return 'confirmed';
      case ContributionStatus.declined:
        return 'declined';
    }
  }

  static List<ContributionStatus> get availableValues => [
        ContributionStatus.all,
        ContributionStatus.confirmed,
        ContributionStatus.pending,
        ContributionStatus.declined,
      ];

  String get displayName => switch (this) {
        all => AppTrans.contributionStatusAll,
        pending => AppTrans.pending,
        confirmed => AppTrans.confirmed,
        declined => AppTrans.declined,
      };

  Color backgroundColor(BuildContext context) => switch (this) {
        all => context.colors.surface,
        pending => context.colors.pendingBackgroundColor,
        confirmed => context.colors.confirmedBackgroundColor,
        declined => context.colors.declinedBackgroundColor,
      };

  Color onBackgroundColor(BuildContext context) => switch (this) {
        all => context.colors.onSurface,
        pending => context.colors.onPendingBackgroundColor,
        confirmed => context.colors.onConfirmedBackgroundColor,
        declined => context.colors.onDeclinedBackgroundColor,
      };

  Color indicatorColor(BuildContext context) => switch (this) {
        all => context.colors.onPrimaryVariant,
        // Yellow dark
        pending => Color(0xFFFFA000),
        confirmed => Color(0xFF00A86B),
        declined => Color(0xFFD32F2F),
      };
}
