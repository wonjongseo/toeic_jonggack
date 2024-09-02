import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/screens/jlpt_study_sceen.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question_step.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:jonggack_toeic_japanese/repository/toeic_question_step_repository.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_question_test_screen.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_score_screen.dart';

import '../../../../model/Question.dart';

import '../../../../user/controller/user_controller.dart';

class ToeicQuestionStepController extends GetxController {
  int currChapNumber = 0;

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

  int getScore() {
    int aa = 0;
    for (int i = 0; i < getJlptStep().toeicQuestions.length; i++) {
      bool? wasCorrected = getJlptStep().toeicQuestions[i].wasCorrected;

      if (wasCorrected == true) {
        aa++;
      }
    }
    return aa;
  }

  void changeIsFinishedState() async {
    if (getJlptStep().isFinished == null) {
      getJlptStep().isFinished = false;
    } else {
      if (getJlptStep().isFinished == false) {
        //
        int aa = getScore();
        if (aa == getJlptStep().toeicQuestions.length) {
          getJlptStep().isFinished = true;
        }
      }
    }
    update();
  }

  int inStep = 0;
  void getToTestScreen(int newInStep) async {
    // outStep = indexOfStep;
    inStep = newInStep;

    changeIsFinishedState();

    if (getJlptStep().wrongToeicQuestions.isNotEmpty) {
      isOnlyWrongQuestion = await CommonDialog.alertPreviousTestRequired();
    }
    if (isOnlyWrongQuestion) {
      jlptSteps[inStep].toeicQuestions =
          jlptSteps[inStep].toeicQuestions.where((e) {
        if (e.wasCorrected == true) {
          return false;
        }
        return true;
      }).toList();
    }

    // questions;
    update();
    Get.to(() => const ToeicQuestionTestScreen());
  }

  bool isOnlyWrongQuestion = false;

  void setInStep(int newInStep) {
    inStep = newInStep;
    update();
  }

  List<ToeicQuestionStep> jlptSteps = [];

  final String level;
  late String headTitle;
  late int totalStepCount;
  late int outStep;

  ToeicQuestionStepRepositroy jlptStepRepositroy =
      ToeicQuestionStepRepositroy();
  UserController userController = Get.find<UserController>();

  ToeicQuestionStepController({required this.level}) {
    totalStepCount = jlptStepRepositroy.getStepTotalCount(level);
    //TODO
    // get last Step Index
    outStep = 0;
    setOutStep(outStep.toString());
  }

  void setStep(int step) {
    this.outStep = step;
  }

  List<ToeicQuestion> questions = [];

  /*
   * 테스트로 만점이면 초기화.
   */
  void clearScore() {
    int score = jlptSteps[outStep].scores;
    jlptSteps[outStep].scores = 0;
    update();
    ToeicQuestionStepRepositroy.updateToeicQuestionStep(
        level, jlptSteps[outStep]);
    userController.updateCurrentProgress(TotalProgressType.JLPT, level, -score);
  }

  void updateScore(int score) {
    // 모든 점수에 해당 점수가 이미 기록 되어 있던가 ?
    int previousScore = jlptSteps[inStep].scores;

    if (previousScore != 0) {
      userController.updateCurrentProgress(
          TotalProgressType.JLPT, level, -previousScore);
    }

    score = score + previousScore;

    // 다 맞췄으면
    if (score >= jlptSteps[inStep].toeicQuestions.length) {
      jlptSteps[inStep].isFinished = true;
    }
    // 에러 발생.
    if (score > jlptSteps[inStep].toeicQuestions.length) {
      score = jlptSteps[inStep].toeicQuestions.length;
    }

    // jlptSteps[step].wrongQestion = wrongQestion;
    jlptSteps[inStep].scores = score;

    update();

    ToeicQuestionStepRepositroy.updateToeicQuestionStep(
      level,
      jlptSteps[inStep],
    );
    userController.updateCurrentProgress(TotalProgressType.JLPT, level, score);

    // 처음 보던가
  }

  ToeicQuestionStep getJlptStep() {
    return jlptSteps[inStep];
  }

  ToeicQuestion getToeicQuestion(int indexOfQuestion) {
    return jlptSteps[inStep].toeicQuestions[indexOfQuestion];
  }

  void setOutStep(String headTitle) {
    //TODO
    inStep = 0;
    this.headTitle = headTitle;

    jlptSteps = jlptStepRepositroy.getJlptStepByHeadTitle(level, headTitle);

    currChapNumber =
        LocalReposotiry.getCurrentProgressing('Japaneses-$level-$headTitle');

    setStep(int.parse(headTitle));
    update();
  }

  void finishQuizAndchangeHeaderPageIndex() {
    int currentHeaderPageIndex =
        LocalReposotiry.getCurrentProgressing('Japaneses-$level-$headTitle');
    if (currentHeaderPageIndex + 1 == jlptSteps.length) {
// TODO

      return;
    }
    outStep = currentHeaderPageIndex + 1;
    LocalReposotiry.putCurrentProgressing(
        'Japaneses-$level-$headTitle', outStep);
    pageController.jumpToPage(outStep);
    // pageController.animateToPage(
    //   step,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeIn,
    // );
  }

  void changeHeaderPageIndex(int index) {
    outStep = index;
    LocalReposotiry.putCurrentProgressing(
        'Japaneses-$level-$headTitle', outStep);
    pageController.animateToPage(
      outStep,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void sss() {
    currChapNumber = 3;
    update();
  }

  //  ABOUT TEST
  int currentPageIndex = 0;
  late PageController pageController =
      PageController(initialPage: currentPageIndex);
}

class ToeicQuestionTestController extends GetxController {
  late AnimationController anmationController;
  bool isFlipped = false;
  int indexOfQuestion = 0;
  int currentPageIndex = 0;
  late PageController pageController =
      PageController(initialPage: currentPageIndex);

  int selectedIndex2 = -1;
  bool isSubmitted = false;
  int isProgrssing = 0;
  bool isCorrect = false;
  String selectedAnswer = '';

  int countOfCorrectQuestion = 10;
  bool isOpenDescription = false;

  ToeicQuestionStepController toeicQuestionStepController =
      Get.find<ToeicQuestionStepController>();

  String actionString() {
    return isLastQuestion() ? '提出' : '次へ';
  }

  void flipCard() {
    if (isFlipped) {
      anmationController.reverse();
    } else {
      anmationController.forward();
    }
    isFlipped = !isFlipped;
  }

  void onPageChanged(value) {
    isSubmitted = false;
    isCorrect = false;
    selectedAnswer = '';
    currentPageIndex = value;
    isOpenDescription = false;

    if (isFlipped) {
      anmationController.reverse();
    }

    indexOfQuestion = indexOfQuestion + 1;
    update();
  }

  // bool isFlipped = false;

  void clickOneOfTheAnswers(int clickedIndex) {
    if (isSubmitted == false) {
      isSubmitted = true;
      selectedIndex2 = clickedIndex;

      update();
      ToeicQuestion toeicQuestion =
          toeicQuestionStepController.getToeicQuestion(indexOfQuestion);
      selectedAnswer = toeicQuestion.answers[clickedIndex];

      if (selectedAnswer.contains(toeicQuestion.answer)) {
        isCorrect = true;
      } else {
        isCorrect = false;
      }

      toeicQuestion.wasCorrected = isCorrect;

      if (toeicQuestion.wasCorrected == false) {
        toeicQuestionStepController
            .getJlptStep()
            .wrongToeicQuestions
            .add(toeicQuestion);
      }

      if (isLastQuestion()) {
        toeicQuestionStepController.updateScore(countOfCorrectQuestion);
        // ToeicQuestionStepRepositroy.updateToeicQuestionStep(
        //     '1', toeicQuestionStepController.getJlptStep());
        // updateToeicQuestionStep
        return;
      }

      update();
      // isSubmitted = false;
    }
  }

  void submit() {
    toeicQuestionStepController.changeIsFinishedState();

    Get.off(
      () => ToeicScoreScreen(
        wrongToeicQuestions:
            toeicQuestionStepController.getJlptStep().wrongToeicQuestions,
      ),
    );
  }

  bool isLastQuestion() {
    return indexOfQuestion + 1 >=
        toeicQuestionStepController.getJlptStep().toeicQuestions.length;
  }

  FontWeight? getFontWeight(ToeicQuestion tChapter, int index2) {
    Color? color = getColor(index2);
    if (color == null || color! == Colors.black) {
      return null;
    } else {
      return FontWeight.bold;
    }
  }

  Color? getColor(int index2) {
    if (selectedAnswer == '') {
      return null;
    } else {
      ToeicQuestion toeicQuestion =
          toeicQuestionStepController.getToeicQuestion(indexOfQuestion);
      selectedAnswer = toeicQuestion.answers[index2];
      if (selectedAnswer.contains(toeicQuestion.answer)) {
        return AppColors.mainBordColor;
      } else if (index2 == selectedIndex2) {
        return Colors.red;
      }
    }
    return Colors.black;
  }
}
