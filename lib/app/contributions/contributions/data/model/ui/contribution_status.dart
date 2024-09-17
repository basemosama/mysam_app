import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';

enum ContributionStatus {
  pending,
  confirmed,
  declined;

  static ContributionStatus fromString(String status) {
    switch (status) {
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
      case ContributionStatus.pending:
        return 'pending';
      case ContributionStatus.confirmed:
        return 'confirmed';
      case ContributionStatus.declined:
        return 'declined';
    }
  }

  String get displayName => switch (this) {
        pending => AppTrans.pending,
        confirmed => AppTrans.confirmed,
        declined => AppTrans.declined,
      };

  Color backgroundColor(BuildContext context) => switch (this) {
        pending => context.colors.pendingBackgroundColor,
        confirmed => context.colors.confirmedBackgroundColor,
        declined => context.colors.declinedBackgroundColor,
      };

  Color onBackgroundColor(BuildContext context) => switch (this) {
        pending => context.colors.onPendingBackgroundColor,
        confirmed => context.colors.onConfirmedBackgroundColor,
        declined => context.colors.onDeclinedBackgroundColor,
      };
}
