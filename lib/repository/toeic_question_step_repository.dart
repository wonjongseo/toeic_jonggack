import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question_step.dart';
// import 'package:jonggack_toeic_japanese/model/word.dart';

import '../common/app_constant.dart';

class ToeicQuestionStepRepositroy {
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
    log('ToeicQuestionStepRepositroy ${nLevel}N init');

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
          scores: 0,
        );

        String boxKey = '$nLevel-$day-$stepCount';
        await box.put(boxKey, tempJlptStep);
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

    print('jlptStepList[0]. : ${jlptStepList[0].toeicQuestions[0].id}');

    return jlptStepList;
  }

  int getStepTotalCount(String nLevel) {
    final box = Hive.box(ToeicQuestionStep.boxKey);

    int jlptHeadTieleCount = box.get('$nLevel-step-count', defaultValue: 0);

    return jlptHeadTieleCount;
  }

  static void updateToeicQuestionStep(
      String nLevel, ToeicQuestionStep updateToeciQuestion) {
    final box = Hive.box(ToeicQuestionStep.boxKey);

    String key =
        '$nLevel-${updateToeciQuestion.headTitle}-${updateToeciQuestion.step}';

    box.put(key, updateToeciQuestion);
  }
}
