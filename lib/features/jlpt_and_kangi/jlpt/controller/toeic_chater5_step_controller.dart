import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question_step.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:jonggack_toeic_japanese/repository/toeic_question_step_repository.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_question_test_screen.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_score_screen.dart';

import '../../../../model/Question.dart';

import '../../../../user/controller/user_controller.dart';

class ToeicQuestionStepController extends GetxController {
  String getTestProgressText(int indexOfStep) {
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
    LocalReposotiry.putCurrentProgressing(
        'Chapter5-OutStep-Index-$outStep', newInStep);

    // outStep = indexOfStep;
    inStep = newInStep;

    changeIsFinishedState();

    if (getJlptStep().wrongToeicQuestions.isNotEmpty &&
        getJlptStep().wrongToeicQuestions.length !=
            getJlptStep().toeicQuestions.length) {
      isOnlyWrongQuestion =
          await CommonDialog.askStartToRemainQuestionsDialog();
    } else {
      isOnlyWrongQuestion = false;
    }
    if (isOnlyWrongQuestion) {
      questions = getJlptStep().wrongToeicQuestions;

      ToeicQuestionStepRepositroy.updateToeicQuestionStep('1', getJlptStep());
    } else {
      questions = getJlptStep().toeicQuestions;
    }
    getJlptStep().wrongToeicQuestions = [];

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
    outStep = LocalReposotiry.getCurrentProgressing('Chapter5-OutStep-Index');

    inStep = LocalReposotiry.getCurrentProgressing(
        'Chapter5-OutStep-Index-${outStep}');

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
    userController.updateCurrentProgress(
        TotalProgressType.GRAMMAR, level, -score);
  }

  void updateScore(int score) {
    // 모든 점수에 해당 점수가 이미 기록 되어 있던가 ?
    int previousScore = jlptSteps[inStep].scores;

    if (previousScore != 0) {
      userController.updateCurrentProgress(
          TotalProgressType.GRAMMAR, level, -previousScore);
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

    ToeicQuestionStepRepositroy.updateToeicQuestionStep(
      level,
      jlptSteps[inStep],
    );
    userController.updateCurrentProgress(
        TotalProgressType.GRAMMAR, level, score);

    update();
    // 처음 보던가
  }

  ToeicQuestionStep getJlptStep() {
    return jlptSteps[inStep];
  }

  ToeicQuestion getToeicQuestion(int indexOfQuestion) {
    return questions[indexOfQuestion];
  }

  void setOutStep(String outStep) {
    //TODO

    this.headTitle = outStep;

    jlptSteps = jlptStepRepositroy.getJlptStepByHeadTitle(level, outStep);

    LocalReposotiry.putCurrentProgressing(
        'Chapter5-OutStep-Index', int.parse(outStep));

    setStep(int.parse(outStep));
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

  //  ABOUT TEST
  int currentPageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  late PageController pageController;
}
