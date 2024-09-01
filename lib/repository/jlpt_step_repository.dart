import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:jonggack_toeic_japanese/common/common.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_home/screens/jlpt_home_screen.dart';
import 'package:jonggack_toeic_japanese/model/jlpt_step.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';
import 'package:jonggack_toeic_japanese/repository/kangis_step_repository.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';

import '../common/app_constant.dart';

class JlptRepositry {
  static Future<Word?> searchWord(String query) async {
    final wordBox = Hive.box<Word>(Word.boxKey);
    Word? word = await wordBox.get(query);

    return word;
  }

  static Future<List<Word>> searchWords(String query) async {
    final wordBox = Hive.box<Word>(Word.boxKey);

    List<Word> relatedWords = wordBox.values.where((element) {
      if (element.word.contains(query) ||
          element.yomikata.contains(query) ||
          element.mean.contains(query)) {
        return true;
      }
      return false;
    }).toList();

    List<Word> words = wordBox.values.where((element) {
      if (element.word == (query) ||
          element.yomikata == (query) ||
          element.mean == (query)) {
        return true;
      }
      return false;
    }).toList();
    if (words.length < relatedWords.length) {
      return relatedWords;
    } else {
      return words;
    }
  }
}

class JlptStepRepositroy {
  static Future<bool> isExistData() async {
    final box = Hive.box(JlptStep.boxKey);
    return box.isNotEmpty;
  }

  // static Future<bool> isExistData(int nLevel) async {
  //   final box = Hive.box(JlptStep.boxKey);

  //   int jlptHeadTieleCount =
  //       await box.get('$nLevel-step-count', defaultValue: 0);

  //   // For Development
  //   // if (!kReleaseMode) {
  //   //   return false;
  //   // }
  //   return jlptHeadTieleCount != 0;
  // }

  static void deleteAllWord() {
    log('deleteAllWord start');

    final list = Hive.box(JlptStep.boxKey);
    list.deleteAll(list.keys);
    list.deleteFromDisk();
    log('deleteAllWord success');
  }

  static Future<int> init(String nLevel) async {
    log('JlptStepRepositroy ${nLevel}N init');

    final box = Hive.box(JlptStep.boxKey);
    final wordBox = Hive.box<Word>(Word.boxKey);

    List<List<Word>> words = Word.jsonToObject(nLevel);

    int totalCount = 0;
    for (int i = 0; i < words.length; i++) {
      totalCount += words[i].length;
    }
    // 31

    String wordLengthKet = '$nLevel-step-count';

    box.put(wordLengthKet, words.length);

    for (int dayIndex = 0; dayIndex < words.length; dayIndex++) {
      String day = "$dayIndex";

      int wordsLengthByDay = words[dayIndex].length;
      int stepCount = 0;

      for (int step = 0;
          step < wordsLengthByDay;
          step += AppConstant.MINIMUM_STEP_COUNT) {
        List<Word> currentWords = [];

        if (step + AppConstant.MINIMUM_STEP_COUNT > wordsLengthByDay) {
          currentWords = words[dayIndex].sublist(step);
        } else {
          currentWords = words[dayIndex]
              .sublist(step, step + AppConstant.MINIMUM_STEP_COUNT);
        }
        for (Word word in currentWords) {
          KangiStepRepositroy kangiStepRepositroy = KangiStepRepositroy();
          getKangiIndex(word.word, kangiStepRepositroy);
          await wordBox.put(word.word, word);
        }

        JlptStep tempJlptStep = JlptStep(
            headTitle: day, step: stepCount, words: currentWords, scores: 0);

        String tempJlptStepKey = '$nLevel-$day-$stepCount';
        await box.put(tempJlptStepKey, tempJlptStep);
        stepCount++;
      }
      String stepCountKey = '$nLevel-$day';

      await box.put(stepCountKey, stepCount);
    }
    return totalCount;
  }

  // static Future<int> init(String nLevel) async {
  //   log('JlptStepRepositroy ${nLevel}N init');

  //   final box = Hive.box(JlptStep.boxKey);
  //   final wordBox = Hive.box<Word>(Word.boxKey);
  //   List<List<Word>> words = await Word.jsonToObject(nLevel);
  //   int totalCount = 0;
  //   for (int i = 0; i < words.length; i++) {
  //     totalCount += words[i].length;
  //   }
  //   log('totalCount: $totalCount');

  //   box.put('$nLevel-step-count', words.length);

  //   for (int hiraganaIndex = 0; hiraganaIndex < words.length; hiraganaIndex++) {
  //     String hiragana = words[hiraganaIndex][0].headTitle;

  //     int wordsLengthByHiragana = words[hiraganaIndex].length;
  //     int stepCount = 0;

  //     for (int step = 0;
  //         step < wordsLengthByHiragana;
  //         step += AppConstant.MINIMUM_STEP_COUNT) {
  //       List<Word> currentWords = [];

  //       if (step + AppConstant.MINIMUM_STEP_COUNT > wordsLengthByHiragana) {
  //         currentWords = words[hiraganaIndex].sublist(step);
  //       } else {
  //         currentWords = words[hiraganaIndex]
  //             .sublist(step, step + AppConstant.MINIMUM_STEP_COUNT);
  //       }

  //       for (Word word in currentWords) {
  //         KangiStepRepositroy kangiStepRepositroy = KangiStepRepositroy();
  //         getKangiIndex(word.word, kangiStepRepositroy);
  //         await wordBox.put(word.word, word);
  //       }
  //       JlptStep tempJlptStep = JlptStep(
  //           headTitle: hiragana,
  //           step: stepCount,
  //           words: currentWords,
  //           scores: 0);

  //       String key = '$nLevel-$hiragana-$stepCount';
  //       LocalReposotiry.putCurrentProgressing(
  //         '${CategoryEnum.Japaneses.name}-$nLevel-$hiragana',
  //         0,
  //       );
  //       print('key : ${key}');

  //       await box.put(key, tempJlptStep);
  //       stepCount++;
  //     }

  //     await box.put('$nLevel-$hiragana', stepCount);
  //   }
  //   LocalReposotiry.putCurrentProgressing(
  //       '${CategoryEnum.Japaneses.name}-$nLevel', 0);

  //   return totalCount;
  // }

  List<JlptStep> getJlptStepByHeadTitle(String nLevel, String headTitle) {
    final box = Hive.box(JlptStep.boxKey);
    print('nLevel : ${nLevel}');
    print('headTitle : ${headTitle}');

    int headTitleStepCount = box.get('$nLevel-$headTitle');

    List<JlptStep> jlptStepList = [];

    for (int step = 0; step < headTitleStepCount; step++) {
      String key = '$nLevel-$headTitle-$step';
      JlptStep jlptStep = box.get(key);
      jlptStepList.add(jlptStep);
    }
    return jlptStepList;
  }

  int getCountByJlptHeadTitle(String nLevel) {
    final box = Hive.box(JlptStep.boxKey);

    int jlptHeadTieleCount = box.get('$nLevel-step-count', defaultValue: 0);

    return jlptHeadTieleCount;
  }

  void updateJlptStep(String nLevel, JlptStep newJlptStep) {
    final box = Hive.box(JlptStep.boxKey);

    String key = '$nLevel-${newJlptStep.headTitle}-${newJlptStep.step}';
    box.put(key, newJlptStep);
  }

  static Future<int> updateJlptStepData(String nLevel) async {
    log('JlptStepRepositroy ${nLevel}N Update');

    final box = Hive.box(JlptStep.boxKey);
    final wordBox = Hive.box<Word>(Word.boxKey);

    List<List<Word>> words = await Word.jsonToObject(nLevel);
    int totalCount = 0;

    for (int i = 0; i < words.length; i++) {
      totalCount += words[i].length;
    }
    log('totalCount: $totalCount');

    box.put('$nLevel-step-count', words.length);

    for (int hiraganaIndex = 0; hiraganaIndex < words.length; hiraganaIndex++) {
      String hiragana = words[hiraganaIndex][0].headTitle;

      int wordsLengthByHiragana = words[hiraganaIndex].length;
      int stepCount = 0;

      for (int step = 0;
          step < wordsLengthByHiragana;
          step += AppConstant.MINIMUM_STEP_COUNT) {
        List<Word> currentWords = [];

        if (step + AppConstant.MINIMUM_STEP_COUNT > wordsLengthByHiragana) {
          currentWords = words[hiraganaIndex].sublist(step);
        } else {
          currentWords = words[hiraganaIndex]
              .sublist(step, step + AppConstant.MINIMUM_STEP_COUNT);
        }

        for (Word word in currentWords) {
          KangiStepRepositroy kangiStepRepositroy = KangiStepRepositroy();
          getKangiIndex(word.word, kangiStepRepositroy);
          await wordBox.put(word.word, word);
        }
        String key = '$nLevel-$hiragana-$stepCount';

        JlptStep? beforeJlptStep = await box.get(key);
        if (beforeJlptStep == null) return 0;
        beforeJlptStep.words = currentWords;

        LocalReposotiry.putCurrentProgressing(
          '${CategoryEnum.Japaneses.name}-$nLevel-$hiragana',
          0,
        );
        await box.put(key, beforeJlptStep);
        stepCount++;
      }

      await box.put('$nLevel-$hiragana', stepCount);
    }
    LocalReposotiry.putCurrentProgressing(
        '${CategoryEnum.Japaneses.name}-$nLevel', 0);

    return totalCount;
  }
}
