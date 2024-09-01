import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question_step.dart';
// import 'package:jonggack_toeic_japanese/model/word.dart';

import '../common/app_constant.dart';

class ToeicChapter5StepRepositroy {
  static Future<bool> isExistData() async {
    final box = Hive.box(ToeicQuestionStep.boxKey);
    return box.isNotEmpty;
  }

  static void deleteAllWord() {
    log('deleteAllWord start');

    final list = Hive.box(ToeicQuestionStep.boxKey);
    list.deleteAll(list.keys);
    list.deleteFromDisk();
    log('deleteAllWord success');
  }

  static Future<int> init(String nLevel) async {
    log('JlptStepRepositroy ${nLevel}N init');

    final box = Hive.box(ToeicQuestionStep.boxKey);

    List<List<ToeicQuestion>> toeicQuestions =
        ToeicQuestion.jsonToObject(nLevel);
    int totalCount = 0;
    for (int i = 0; i < toeicQuestions.length; i++) {
      totalCount += toeicQuestions[i].length;
    }

    String wordLengthKet = '$nLevel-step-count';
    print('wordLengthKet : ${wordLengthKet}');

    box.put(wordLengthKet, toeicQuestions.length);

    for (int dayIndex = 0; dayIndex < toeicQuestions.length; dayIndex++) {
      String day = "$dayIndex";

      int wordsLengthByDay = toeicQuestions[dayIndex].length;
      int stepCount = 0;

      for (int step = 0;
          step < wordsLengthByDay;
          step += AppConstant.MINIMUM_STEP_COUNT) {
        List<ToeicQuestion> currentWords = [];

        if (step + AppConstant.MINIMUM_STEP_COUNT > wordsLengthByDay) {
          currentWords = toeicQuestions[dayIndex].sublist(step);
        } else {
          currentWords = toeicQuestions[dayIndex]
              .sublist(step, step + AppConstant.MINIMUM_STEP_COUNT);
        }

        ToeicQuestionStep tempJlptStep = ToeicQuestionStep(
            headTitle: day,
            step: stepCount,
            toeicQuestions: currentWords,
            scores: 0);

        String boxKey = '$nLevel-$day-$stepCount';
        await box.put(boxKey, tempJlptStep);
        print('boxKey : ${boxKey}');

        stepCount++;
      }
      String stepCountKey = '$nLevel-$day';

      await box.put(stepCountKey, stepCount);
    }
    return totalCount;
  }

  List<ToeicQuestionStep> getJlptStepByHeadTitle(
      String nLevel, String headTitle) {
    final box = Hive.box(ToeicQuestionStep.boxKey);

    int headTitleStepCount = box.get('$nLevel-$headTitle');

    List<ToeicQuestionStep> jlptStepList = [];

    for (int step = 0; step < headTitleStepCount; step++) {
      String key = '$nLevel-$headTitle-$step';
      ToeicQuestionStep jlptStep = box.get(key);
      jlptStepList.add(jlptStep);
    }
    print('jlptStepList : ${jlptStepList[0].toeicQuestions[0].id}');

    return jlptStepList;
  }

  int getStepTotalCount(String nLevel) {
    final box = Hive.box(ToeicQuestionStep.boxKey);

    int jlptHeadTieleCount = box.get('$nLevel-step-count', defaultValue: 0);

    return jlptHeadTieleCount;
  }

  void updateJlptStep(String nLevel, ToeicQuestionStep newJlptStep) {
    final box = Hive.box(ToeicQuestionStep.boxKey);

    String key = '$nLevel-${newJlptStep.headTitle}-${newJlptStep.step}';
    box.put(key, newJlptStep);
  }

  // static Future<int> updateJlptStepData(String nLevel) async {
  //   log('JlptStepRepositroy ${nLevel}N Update');

  //   final box = Hive.box(ToeicChapter5Step.boxKey);
  //   final wordBox = Hive.box<Word>(Word.boxKey);

  //   List<List<ToeicChapter5>> words = await ToeicChapter5.jsonToObject(nLevel);
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
  //         step += 10) {
  //       List<Word> currentWords = [];

  //       if (step + 10 > wordsLengthByHiragana) {
  //         currentWords = words[hiraganaIndex].sublist(step);
  //       } else {
  //         currentWords = words[hiraganaIndex]
  //             .sublist(step, step + 10);
  //       }

  //       for (Word word in currentWords) {
  //         KangiStepRepositroy kangiStepRepositroy = KangiStepRepositroy();
  //         getKangiIndex(word.word, kangiStepRepositroy);
  //         await wordBox.put(word.word, word);
  //       }
  //       String key = '$nLevel-$hiragana-$stepCount';

  //       JlptStep? beforeJlptStep = await box.get(key);
  //       if (beforeJlptStep == null) return 0;
  //       beforeJlptStep.words = currentWords;

  //       LocalReposotiry.putCurrentProgressing(
  //         '${CategoryEnum.Japaneses.name}-$nLevel-$hiragana',
  //         0,
  //       );
  //       await box.put(key, beforeJlptStep);
  //       stepCount++;
  //     }

  //     await box.put('$nLevel-$hiragana', stepCount);
  //   }
  //   LocalReposotiry.putCurrentProgressing(
  //       '${CategoryEnum.Japaneses.name}-$nLevel', 0);

  //   return totalCount;
  // }
}
