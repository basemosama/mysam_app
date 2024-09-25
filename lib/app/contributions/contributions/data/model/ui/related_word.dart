import 'package:mysam_app/app/contributions/contributions/data/model/ui/contribution_related_word_type.dart';

class ContributionRelatedWord {
  final String word;
  final ContributionRelatedWordType? type;
  final String? typeMeta;
  final String? weight;
  final List<String>? metadata;

  const ContributionRelatedWord({
    required this.word,
    this.type,
    this.typeMeta,
    this.weight,
    this.metadata,
  });
}
