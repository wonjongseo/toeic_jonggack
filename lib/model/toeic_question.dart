import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:jonggack_toeic_japanese/data/toeic_chater_five.dart';
import 'package:jonggack_toeic_japanese/model/hive_type.dart';

part 'toeic_question.g.dart';

@HiveType(typeId: toeicChater5TypeId)
class ToeicQuestion {
  static String boxKey = 'toeic_chapter5_key';
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String question;
  @HiveField(3)
  late List<String> answers;
  @HiveField(4)
  late String description;
  @HiveField(5)
  late String answer;
  @HiveField(6)
  late String mean;
  @HiveField(7) // null = 안품 , false = unCorrect  , true == correct
  bool? wasCorrected;

  ToeicQuestion({
    required this.id,
    required this.question,
    required this.answers,
    required this.description,
    required this.answer,
    required this.mean,
  });

  ToeicQuestion copyWith({
    String? id,
    String? question,
    List<String>? answers,
    String? description,
    String? answer,
    String? mean,
  }) {
    return ToeicQuestion(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers,
      description: description ?? this.description,
      answer: answer ?? this.answer,
      mean: mean ?? this.mean,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'question': question});
    result.addAll({'answers': answers});
    result.addAll({'description': description});
    result.addAll({'answer': answer});
    result.addAll({'mean': mean});

    return result;
  }

  factory ToeicQuestion.fromMap(Map<String, dynamic> map) {
    return ToeicQuestion(
      id: (map['id']),
      question: (map['question']),
      answers: (map['answers']),
      description: (map['description']),
      answer: (map['answer']),
      mean: (map['mean']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ToeicQuestion.fromJson(String source) =>
      ToeicQuestion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ToeicChapter5(id: $id, question: $question, answers: $answers, description: $description, answer: $answer, mean: $mean)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ToeicQuestion &&
        other.id == id &&
        other.question == question &&
        other.answers == answers &&
        other.description == description &&
        other.answer == answer &&
        other.mean == mean;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        question.hashCode ^
        answers.hashCode ^
        description.hashCode ^
        answer.hashCode ^
        mean.hashCode;
  }

  static List<List<ToeicQuestion>> jsonToObject(String nLevel) {
    List<List<ToeicQuestion>> chaterFiveQestion = [];
    for (int i = 0; i < chaterFiveQuestions.length; i++) {
      List<ToeicQuestion> tempChaterFiveQestion = [];
      for (int j = 0; j < chaterFiveQuestions[i].length; j++) {
        tempChaterFiveQestion.add(
          ToeicQuestion.fromMap(chaterFiveQuestions[i][j]),
        );
      }
      chaterFiveQestion.add(tempChaterFiveQestion);
    }
    return chaterFiveQestion;
  }
}
