import 'package:flutter/widgets.dart';
import 'package:mysam_app/core/resources/translation/app_translations.dart';
import 'package:playx/playx.dart';

class ContainsLettersRule extends TextValidationRule {
  final String word;
  ContainsLettersRule({
    String? error = AppTrans.shouldContainRootLettersError,
    required this.word,
  }) : super(error);

  @override
  bool isValid(String input) {
    final inputLetters = input.characters;
    final otherWordLetters = word.characters;

    bool containsAll = false;
    for (final letter in otherWordLetters) {
      if (inputLetters.contains(letter)) {
        containsAll = true;
      } else {
        containsAll = false;
        break;
      }
    }
    return containsAll;
  }
}
