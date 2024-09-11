import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/common.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_home/screens/jlpt_home_screen.dart';
import 'package:jonggack_toeic_japanese/features/kangi_test/kangi_test_screen.dart';
import 'package:jonggack_toeic_japanese/model/kangi.dart';
import 'package:jonggack_toeic_japanese/model/kangi_step.dart';
import 'package:jonggack_toeic_japanese/model/my_word.dart';

import 'package:jonggack_toeic_japanese/repository/kangis_step_repository.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:jonggack_toeic_japanese/repository/my_word_repository.dart';

import '../../../../model/Question.dart';
import '../../../kangi_study/widgets/screens/kangi_study_sceen.dart';
import '../../../../user/controller/user_controller.dart';

class KangiStepController extends GetxController {
  void toggleAllSave() {
    if (isAllSave()) {
      for (int i = 0; i < getKangiStep().kangis.length; i++) {
        Kangi kangi = getKangiStep().kangis[i];
        MyWord newMyWord = MyWord.kangiToMyWord(kangi);

        if (isSavedInLocal(kangi)) {
          MyWordRepository.deleteMyWord(newMyWord);
          userController.updateMyWordSavedCount(false);
        }
      }
      // isAllSave = false;
    } else {
      for (int i = 0; i < getKangiStep().kangis.length; i++) {
        Kangi kangi = getKangiStep().kangis[i];

        MyWord newMyWord = MyWord.kangiToMyWord(kangi);

        if (!isSavedInLocal(kangi)) {
          MyWordRepository.saveMyWord(newMyWord);
          userController.updateMyWordSavedCount(true);
          isWordSaved = true;
        }
      }

      // isAllSave = true;
    }
    update();
  }

  bool isAllSave() {
    int savedWordCount = 0;
    for (int i = 0; i < getKangiStep().kangis.length; i++) {
      Kangi kangi = getKangiStep().kangis[i];

      if (isSavedInLocal(kangi)) {
        savedWordCount++;
      }
    }

    return savedWordCount == getKangiStep().kangis.length;
  }

  void toggleSeeMean(bool? v) {
    isHidenMean = v!;
    update();
  }

  bool isHidenMean = false;

  void onPageChanged(int page) {
    currentIndex = page;
    isWordSaved = false;
    update();
  }

  bool isWordSaved = false;
  bool isSavedInLocal(Kangi kangi) {
    MyWord newMyWord = MyWord.kangiToMyWord(kangi);

    newMyWord.createdAt = DateTime.now();
    isWordSaved = MyWordRepository.savedInMyWordInLocal(newMyWord);

    return isWordSaved;
  }

  void toggleSaveWord(Kangi kangi) {
    MyWord newMyWord = MyWord.kangiToMyWord(kangi);
    if (isSavedInLocal(kangi)) {
      MyWordRepository.deleteMyWord(newMyWord);
      userController.updateMyWordSavedCount(false);
      isWordSaved = false;
    } else {
      MyWordRepository.saveMyWord(newMyWord);
      userController.updateMyWordSavedCount(true);
      isWordSaved = true;
    }
    update();
  }

  Future<void> goToTest({bool isOffAndToName = false}) async {
    if (getKangiStep().wrongQuestion != null &&
        getKangiStep().scores != 0 &&
        getKangiStep().scores != getKangiStep().kangis.length) {
      bool result = await CommonDialog.askStartToRemainQuestionsDialog();

      if (result) {
        // 과거에 틀린 문제로만 테스트 보기.

        if (isOffAndToName) {
          Get.offAndToNamed(
            KANGI_TEST_PATH,
            arguments: {
              CONTINUTE_KANGI_TEST: getKangiStep().wrongQuestion,
            },
          );
        } else {
          Get.toNamed(
            KANGI_TEST_PATH,
            arguments: {
              CONTINUTE_KANGI_TEST: getKangiStep().wrongQuestion,
            },
          );
        }
        return;
      }
    }
    if (isOffAndToName) {
      Get.offAndToNamed(
        KANGI_TEST_PATH,
        arguments: {
          KANGI_TEST: getKangiStep().kangis,
        },
      );
    } else {
      if (getKangiStep().isFinished == null) {
        clearScore();
      } else {
        if (!getKangiStep().isFinished!) {
          clearScore();
        }
      }
      Get.toNamed(
        KANGI_TEST_PATH,
        arguments: {
          KANGI_TEST: getKangiStep().kangis,
        },
      );
    }
  }

  int currentIndex = 0;
  Kangi getWord() {
    return getKangiStep().kangis[currentIndex];
  }

  List<KangiStep> kangiSteps = [];
  final String level;
  late String headTitle;
  late int headTitleCount;
  late int step;

  KangiStepRepositroy kangiStepRepository = KangiStepRepositroy();
  UserController userController = Get.find<UserController>();

  KangiStepController({required this.level}) {
    headTitleCount = kangiStepRepository.getCountByHangul(level);
  }

  void setStep(int step) {
    this.step = step;

    // if (kangiSteps[step].scores == kangiSteps[step].kangis.length) {
    //   // clearScore();
    // }
  }

  void clearScore() {
    int score = kangiSteps[step].scores;
    kangiSteps[step].scores = 0;
    update();
    kangiStepRepository.updateKangiStep(level, kangiSteps[step]);
    userController.updateCurrentProgress(
        TotalProgressType.KANGI, level, -score);
  }

  void goToStudyPage(int subStep) {
    setStep(subStep);
    Get.toNamed(KANGI_STUDY_PATH);
  }

  void updateScore(int score, List<Question> wrongQestion) {
    int previousScore = kangiSteps[step].scores;

    if (previousScore != 0) {
      userController.updateCurrentProgress(
          TotalProgressType.KANGI, level, -previousScore);
    }

    score = score + previousScore;

    if (score >= kangiSteps[step].kangis.length) {
      kangiSteps[step].isFinished = true;
    } else if (score > kangiSteps[step].kangis.length) {
      score = kangiSteps[step].kangis.length;
    }

    kangiSteps[step].wrongQuestion = wrongQestion;
    kangiSteps[step].scores = score;

    update();
    kangiStepRepository.updateKangiStep(level, kangiSteps[step]);
    userController.updateCurrentProgress(TotalProgressType.KANGI, level, score);
  }

  KangiStep getKangiStep() {
    return kangiSteps[step];
  }

  late PageController pageController;

  void setKangiSteps(String headTitle) {
    this.headTitle = headTitle;

    kangiSteps =
        kangiStepRepository.getKangiStepByHeadTitle(level, this.headTitle);

    step = LocalReposotiry.getCurrentProgressing(
        '${CategoryEnum.Kangis.name}-$level-$headTitle');
    setStep(step);

    update();
  }

  void finishQuizAndchangeHeaderPageIndex() {
    int currentHeaderPageIndex = LocalReposotiry.getCurrentProgressing(
        '${CategoryEnum.Kangis.name}-$level-$headTitle');
    if (currentHeaderPageIndex + 1 == kangiSteps.length) {
// TODO

      return;
    }
    step = currentHeaderPageIndex + 1;
    LocalReposotiry.putCurrentProgressing(
        '${CategoryEnum.Kangis.name}-$level-$headTitle', step);
    pageController.jumpToPage(step);
    // pageController.animateToPage(
    //   step,
    //   duration: const Duration(milliseconds: 300),
    //   curve: Curves.easeIn,
    // );
  }

  void changeHeaderPageIndex(int index) {
    step = index;
    LocalReposotiry.putCurrentProgressing(
        '${CategoryEnum.Kangis.name}-$level-$headTitle', step);
    pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
