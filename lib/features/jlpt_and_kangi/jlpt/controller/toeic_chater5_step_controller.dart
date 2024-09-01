import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/screens/jlpt_study_sceen.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question_step.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:jonggack_toeic_japanese/repository/toeic_chatper5_step_repository.dart';
import 'package:jonggack_toeic_japanese/toeic_question_test_screen.dart';

import '../../../../model/Question.dart';

import '../../../../user/controller/user_controller.dart';

class ToeicQuestionStepController extends GetxController {
  int currChapNumber = 0;

  void toggleSeeMean(bool? v) {
    isSeeMean = !v!;
    update();
  }

  String getTestProgress(int indexOfStep) {
    if (jlptSteps[indexOfStep].isFinished == null) {
      return 'テスト前';
    } else {
      if (jlptSteps[indexOfStep].isFinished == false) {
        return 'テスト中';
      } else {
        return 'テスト済み';
      }
    }
  }

  Color getTestColor(int indexOfStep) {
    if (jlptSteps[indexOfStep].isFinished == null) {
      return Colors.redAccent;
    } else {
      if (jlptSteps[indexOfStep].isFinished == false) {
        return AppColors.mainColor;
      } else {
        return AppColors.lightGreen;
      }
    }
  }

  void getToTestScreen(int indexOfStep) {
    step = indexOfStep;

    update();
    Get.to(() => const ToeicQuestionTestScreen());
  }

  bool isSeeMean = true;
  bool isMoreExample = false;

  void onTapMoreExample() {
    isMoreExample = true;
    update();
  }

  void onPageChanged(int page) {
    isMoreExample = false;
    update();
    currentIndex = page;

    update();
  }

  bool isWordSaved = false;
  int currentIndex = 0;
  ToeicQuestion getWord() {
    return getJlptStep().toeicQuestions[currentIndex];
  }

  List<ToeicQuestionStep> jlptSteps = [];

  final String level;
  late String headTitle;
  late int totalStepCount;
  late int step;

  ToeicChapter5StepRepositroy jlptStepRepositroy =
      ToeicChapter5StepRepositroy();
  UserController userController = Get.find<UserController>();

  ToeicQuestionStepController({required this.level}) {
    totalStepCount = jlptStepRepositroy.getStepTotalCount(level);
  }

  void goToStudyPage(int subStep) {
    setStep(subStep);
    Get.toNamed(JLPT_STUDY_PATH);
  }

  void setStep(int step) {
    step = 0;
    this.step = step;
  }

  /*
   * 테스트로 만점이면 초기화.
   */
  void clearScore() {
    int score = jlptSteps[step].scores;
    jlptSteps[step].scores = 0;
    update();
    jlptStepRepositroy.updateJlptStep(level, jlptSteps[step]);
    userController.updateCurrentProgress(TotalProgressType.JLPT, level, -score);
  }

  void updateScore(int score, List<Question> wrongQestion) {
    // 모든 점수에 해당 점수가 이미 기록 되어 있던가 ?
    int previousScore = jlptSteps[step].scores;

    if (previousScore != 0) {
      userController.updateCurrentProgress(
          TotalProgressType.JLPT, level, -previousScore);
    }

    score = score + previousScore;

    // 다 맞췄으면
    if (score >= jlptSteps[step].toeicQuestions.length) {
      jlptSteps[step].isFinished = true;
    }
    // 에러 발생.
    else if (score > jlptSteps[step].toeicQuestions.length) {
      score = jlptSteps[step].toeicQuestions.length;
    }

    // jlptSteps[step].wrongQestion = wrongQestion;
    jlptSteps[step].scores = score;

    update();

    jlptStepRepositroy.updateJlptStep(level, jlptSteps[step]);
    userController.updateCurrentProgress(TotalProgressType.JLPT, level, score);

    // 처음 보던가
  }

  ToeicQuestionStep getJlptStep() {
    return jlptSteps[step];
  }

  void setSteps(String headTitle) {
    this.headTitle = headTitle;

    jlptSteps = jlptStepRepositroy.getJlptStepByHeadTitle(level, headTitle);

    currChapNumber =
        LocalReposotiry.getCurrentProgressing('Japaneses-$level-$headTitle');

    setStep(int.parse(headTitle));
    update();
  }

  late PageController pageController;

  void finishQuizAndchangeHeaderPageIndex() {
    int currentHeaderPageIndex =
        LocalReposotiry.getCurrentProgressing('Japaneses-$level-$headTitle');
    if (currentHeaderPageIndex + 1 == jlptSteps.length) {
// TODO

      return;
    }
    step = currentHeaderPageIndex + 1;
    LocalReposotiry.putCurrentProgressing('Japaneses-$level-$headTitle', step);
    pageController.jumpToPage(step);
    // pageController.animateToPage(
    //   step,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeIn,
    // );
  }

  void changeHeaderPageIndex(int index) {
    step = index;
    LocalReposotiry.putCurrentProgressing('Japaneses-$level-$headTitle', step);
    pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void sss() {
    currChapNumber = 3;
    update();
  }
}
