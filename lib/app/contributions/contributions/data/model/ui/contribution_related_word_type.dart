import 'package:mysam_app/core/resources/translation/app_translations.dart';

enum ContributionRelatedWordType {
  noun,
  verb;

  static ContributionRelatedWordType? fromString(String? value) {
    switch (value) {
      case 'noun':
        return ContributionRelatedWordType.noun;
      case 'verb':
        return ContributionRelatedWordType.verb;
      default:
        return null;
    }
  }

  String toShortString() {
    switch (this) {
      case ContributionRelatedWordType.noun:
        return 'noun';
      case ContributionRelatedWordType.verb:
        return 'verb';
    }
  }

  String get displayName => switch (this) {
        noun => AppTrans.nounLabel,
        verb => AppTrans.verbLabel,
      };
}
