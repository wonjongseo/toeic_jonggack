import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/score/screens/veryGoodScreen.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_score_screen.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

class ToeicQuestionTestController extends GetxController {
  late AnimationController anmationController;
  late ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 10));

  bool isFlipped = false;
  int indexOfQuestion = 0;
  int currentPageIndex = 0;
  late PageController pageController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: currentPageIndex);
    pageController.addListener(() {
      _isScrolling = pageController.page != pageController.page!.round();
      update();
    });
  }

  void exitText() async {
    bool result = await CommonDialog.beforeExitTestPageDialog();

    if (result) {
      toeicQuestionStepController.getJlptStep().wrongToeicQuestions = [];

      Get.back();
    }
  }

  int selectedIndex2 = -1;
  bool isSubmitted = false;
  int isProgrssing = 0;
  bool isCorrect = false;
  String selectedAnswer = '';

  int countOfCorrectQuestion = 0;
  bool isOpenDescription = false;

  ToeicQuestionStepController toeicQuestionStepController =
      Get.find<ToeicQuestionStepController>();

  String actionString() {
    if (isSubmitted) {
      return '次へ';
    } else {
      return 'SKIP';
    }
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
    if (isFlipped) {
      anmationController.reverse();
    }
    isSubmitted = false;
    isCorrect = false;
    selectedAnswer = '';
    currentPageIndex = value;
    isOpenDescription = false;

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
      toeicQuestion.lateUpdate = DateTime.now();
      selectedAnswer = toeicQuestion.answers[clickedIndex];

      if (selectedAnswer.contains(toeicQuestion.answer)) {
        isCorrect = true;
        countOfCorrectQuestion++;
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
        return;
      }

      update();
    }
  }

  bool _isScrolling = false;
  void isScrolling() {
    _isScrolling = pageController.page != pageController.page!.round();
  }

  List<ToeicQuestion> wrongToeicQuestions = [];
  void clickNextOrSkip() {
    if (_isScrolling) return;
    if (!isSubmitted) {
      ToeicQuestion toeicQuestion =
          toeicQuestionStepController.getToeicQuestion(indexOfQuestion);
      // toeicQuestionStepController
      //     .getJlptStep()
      //     .wrongToeicQuestions
      //     .add(toeicQuestion);

      wrongToeicQuestions.add(toeicQuestion);
    }
    if (isLastQuestion()) {
      // if (toeicQuestionStepController
      //     .getJlptStep()
      //     .wrongToeicQuestions
      //     .isEmpty) {
      //   confettiController.play();
      // }
      if (wrongToeicQuestions.isEmpty) {
        confettiController.play();
      } else {
        toeicQuestionStepController.getJlptStep().wrongToeicQuestions =
            wrongToeicQuestions;
      }
      toeicQuestionStepController.updateScore(countOfCorrectQuestion);
      toeicQuestionStepController.changeIsFinishedState();

      submit();
    } else {
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  void submit() {
    if (toeicQuestionStepController.getJlptStep().wrongToeicQuestions.isEmpty) {
      Get.off(() => const VeryGoodScreen());
    } else {
      Get.off(
        () => ToeicScoreScreen(
          wrongToeicQuestions:
              toeicQuestionStepController.getJlptStep().wrongToeicQuestions,
        ),
      );
    }
  }

  bool isLastQuestion() {
    return indexOfQuestion + 1 >= toeicQuestionStepController.questions.length;
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
