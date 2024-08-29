import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/model/grammar_step.dart';
import 'package:jonggack_toeic_japanese/repository/grammar_step_repository.dart';

import '../../../common/app_constant.dart';
import '../../../user/controller/user_controller.dart';

class GrammarController extends GetxController {
  List<GrammarStep> grammers = [];
  late int step;
  late String level;
  GrammarRepositroy grammarRepositroy = GrammarRepositroy();

  bool isSeeMean = true;

  void toggleSeeMean(bool? v) {
    isSeeMean = !v!;
    update();
  }

  int clickedIndex = 0;
  late PageController pageController;
  UserController userController = Get.find<UserController>();

  GrammarController({required this.level}) {
    grammers = grammarRepositroy.getGrammarStepByLevel(level);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  void setStep(int step) {
    this.step = step;

    if (grammers[step].scores == grammers[step].grammars.length) {
      clearScore();
    }
  }

  void clearScore() {
    int subtrackScore = grammers[step].scores;
    grammers[step].scores = 0;
    update();
    grammarRepositroy.updateGrammerStep(grammers[step]);
    userController.updateCurrentProgress(
        TotalProgressType.GRAMMAR, level, -subtrackScore);
  }

  void updateScore(int score, {bool isRetry = false}) {
    int previousScore = grammers[step].scores;

    if (previousScore != 0) {
      userController.updateCurrentProgress(
        TotalProgressType.GRAMMAR,
        level,
        -previousScore,
      );
    }

    if (score == grammers[step].grammars.length) {
      grammers[step].isFinished = true;
    } else if (score > grammers[step].grammars.length) {
      score = grammers[step].grammars.length;
    }

    grammers[step].scores = score;

    update();
    grammarRepositroy.updateGrammerStep(grammers[step]);
    userController.updateCurrentProgress(
        TotalProgressType.GRAMMAR, level, score);
  }

  GrammarStep getGrammarStep() {
    return grammers[step];
  }

  void setGrammarSteps(String level) {
    this.level = level;

    update();
  }

  bool isSuccessedAllGrammar(int subStep) {
    return grammers[subStep].scores == grammers[subStep].grammars.length;
  }

  bool isFinishedPreviousSubStep(int subStep) {
    return grammers[subStep - 1].isFinished ?? false;
  }
}
