import 'package:flutter/material.dart';
import 'package:mysam_app/core/resources/colors/app_colors.dart';

enum RootStatus {
  raw,
  hasConfirmedContribution,
  hasNonConfirmedContribution;

  static RootStatus fromString(String status) {
    switch (status) {
      case 'raw':
        return RootStatus.raw;
      case 'has-confirmed-contribution':
        return RootStatus.hasConfirmedContribution;
      case 'has-non-confirmed-contribution':
        return RootStatus.hasNonConfirmedContribution;
      default:
        throw Exception('Unknown status: $status');
    }
  }

  Color backgroundColor(BuildContext context) => switch (this) {
        raw => context.colors.outlineVariant,
        hasConfirmedContribution => context.colors.confirmedBackgroundColor,
        hasNonConfirmedContribution => context.colors.pendingBackgroundColor,
      };

  Color onBackgroundColor(BuildContext context) => switch (this) {
        raw => Colors.white,
        hasConfirmedContribution => context.colors.onConfirmedBackgroundColor,
        hasNonConfirmedContribution => context.colors.onPendingBackgroundColor,
      };

  String toShortString() {
    switch (this) {
      case RootStatus.raw:
        return 'raw';
      case RootStatus.hasConfirmedContribution:
        return 'has-confirmed-contribution';
      case RootStatus.hasNonConfirmedContribution:
        return 'has-non-confirmed-contribution';
    }
  }
}
