import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';

enum ContributionType {
  qa,
  poem,
  idiom,
  synonyms,
  modernMeaning,
  slang,
  photo,
  unknown;

  String get displayName => switch (this) {
        qa => AppTrans.qaContribution,
        poem => AppTrans.poemContribution,
        idiom => AppTrans.idiomContribution,
        synonyms => AppTrans.synonymsContribution,
        modernMeaning => AppTrans.modernMeaningContribution,
        slang => AppTrans.slangContribution,
        photo => AppTrans.photoContribution,
        unknown => 'Unknown',
      };

  static ContributionType fromString(String? value) => switch (value) {
        'qa' => qa,
        'poem' => poem,
        'idiom' => idiom,
        'synonyms' => synonyms,
        'modern-meaning' => modernMeaning,
        'slang' => slang,
        'photo' => photo,
        _ => unknown,
      };

  String toShortString() => switch (this) {
        qa => 'qa',
        poem => 'poem',
        idiom => 'idiom',
        synonyms => 'synonyms',
        modernMeaning => 'modern-meaning',
        slang => 'slang',
        photo => 'photo',
        unknown => 'unknown',
      };

  static List<ContributionType> availableTypes = [
    qa,
    poem,
    idiom,
    synonyms,
    modernMeaning,
    slang,
    photo,
  ];

  ContributionType fromModel<T>(T model) => switch (model.runtimeType) {
        QAContribution _ => qa,
        PoemContribution _ => poem,
        IdiomContribution _ => idiom,
        SynonymsContribution _ => synonyms,
        ModernMeaningContribution _ => modernMeaning,
        SlangContribution _ => slang,
        PhotoContribution _ => photo,
        _ => unknown,
      };
}
