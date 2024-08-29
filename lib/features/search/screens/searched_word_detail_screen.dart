import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/features/grammar_step/widgets/gammar_card_details.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/jlpt_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/kangi/controller/kangi_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/widgets/word_card.dart';
import 'package:jonggack_toeic_japanese/features/kangi_study/widgets/kangi_card.dart';
import 'package:jonggack_toeic_japanese/model/grammar.dart';
import 'package:jonggack_toeic_japanese/model/kangi.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';

class SearchedWordDetailScreen extends StatelessWidget {
  const SearchedWordDetailScreen(
      {super.key, required this.index, required this.searchedWords});
  final int index;
  final List<Word> searchedWords;

  @override
  Widget build(BuildContext context) {
    Get.put(JlptStepController(level: ''));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: GetBuilder<JlptStepController>(builder: (jlptStepController) {
            return WordCard(
              word: searchedWords[index],
              controller: jlptStepController,
            );
          }),
        ),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}

//

class SearchedKangiDetailScreen extends StatelessWidget {
  const SearchedKangiDetailScreen(
      {super.key, required this.index, required this.searchedKangis});
  final int index;
  final List<Kangi> searchedKangis;

  @override
  Widget build(BuildContext context) {
    Get.put(KangiStepController(level: ''));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: GetBuilder<KangiStepController>(
            builder: (kangiStepController) {
              return KangiCard(
                kangi: searchedKangis[index],
                controller: kangiStepController,
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}

//

class SearchedGrammarDetailScreen extends StatelessWidget {
  const SearchedGrammarDetailScreen(
      {super.key, required this.index, required this.searchedGrammar});
  final int index;
  final List<Grammar> searchedGrammar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: GrammarCard(grammar: searchedGrammar[index]),
        ),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}
