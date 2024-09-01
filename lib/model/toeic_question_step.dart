import 'package:hive/hive.dart';

import 'package:jonggack_toeic_japanese/model/Question.dart';
import 'package:jonggack_toeic_japanese/model/hive_type.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

part 'toeic_question_step.g.dart';

@HiveType(typeId: toeicChater5StepTypeId)
class ToeicQuestionStep {
  static String boxKey = 'toeci_chapter_5_step_key';
  @HiveField(0)
  final String headTitle;
  @HiveField(1)
  final int step;
  @HiveField(2)
  late List<ToeicQuestion> toeicQuestions;
  @HiveField(3)
  List<ToeicQuestion> wrongToeicQuestions = [];
  @HiveField(4)
  int scores;
  @HiveField(5)
  bool? isFinished;

  ToeicQuestionStep({
    required this.headTitle,
    required this.step,
    required this.toeicQuestions,
    required this.scores,
  });

  @override
  String toString() {
    return 'ToeicChapter5Step(headTitle: $headTitle, step: $step, words: $toeicQuestions, wrongWords: $wrongToeicQuestions, scores: $scores, isFinished: $isFinished, )';
  }
}
