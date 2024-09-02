import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jonggack_toeic_japanese/model/example.dart';
import 'package:jonggack_toeic_japanese/model/hive_type.dart';
import 'package:jonggack_toeic_japanese/model/kangi.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';
import 'package:jonggack_toeic_japanese/repository/my_word_repository.dart';

part 'my_word.g.dart';

@HiveType(typeId: MyWordTypeId)
class MyWord {
  static String boxKey = 'my_word';
  @HiveField(0)
  late String word;
  @HiveField(1)
  late String mean;
  @HiveField(3)
  late String? yomikata = '';

  @HiveField(2)
  bool isKnown = false;

  @HiveField(4)
  late DateTime? createdAt;

  @HiveField(5)
  bool? isManuelSave = false;

  @HiveField(6)
  late List<Example>? examples;

  MyWord(
      {required this.word,
      required this.mean,
      required this.yomikata,
      this.isManuelSave = false,
      this.examples}) {
    createdAt = DateTime.now();
  }

  @override
  String toString() {
    return "MyWord{word: $word, mean: $mean, yomikata: $yomikata, isKnown: $isKnown, createdAt: $createdAt, isManuelSave: $isManuelSave}";
  }

  MyWord.fromMap(Map<String, dynamic> map) {
    word = map['word'] ?? '';
    mean = map['mean'] ?? '';
    createdAt = map['createdAt'] ?? '';

    yomikata = map['yomikata'] ?? '';
    isKnown = false;
    examples = [];
  }
  static MyWord kangiToMyWord(Kangi kangi) {
    MyWord newMyWord = MyWord(
        word: kangi.word,
        mean: kangi.mean,
        yomikata: '${kangi.undoc} / ${kangi.hundoc}');

    newMyWord.createdAt = DateTime.now();

    return newMyWord;
  }

  static MyWord wordToMyWord(Word word) {
    MyWord newMyWord = MyWord(
        word: word.word,
        mean: word.mean,
        yomikata: word.yomikata,
        examples: word.examples);

    newMyWord.createdAt = DateTime.now();

    return newMyWord;
  }

  static bool saveToMyVoca(Word word) {
    MyWord newMyWord = wordToMyWord(word);
    if (MyWordRepository.savedInMyWordInLocal(newMyWord)) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          '${word.word}は既に保存されています。',
          '単語帳から確認できます。',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white.withOpacity(0.5),
          duration: const Duration(milliseconds: 1000),
          animationDuration: const Duration(milliseconds: 1000),
        );
      }
      return false;
    } else {
      MyWordRepository.saveMyWord(newMyWord);
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          '${word.word}が保存されました。',
          '単語帳から確認できます。',
          backgroundColor: Colors.white.withOpacity(0.5),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 1000),
          animationDuration: const Duration(milliseconds: 1000),
        );
      }
    }
    return true;
  }

  String createdAtString() {
    return createdAt.toString().substring(0, 16);
  }
}
