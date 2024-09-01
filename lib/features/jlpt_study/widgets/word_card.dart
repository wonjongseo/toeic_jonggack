import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/controller/tts_controller.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/common/widget/kangi_text.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/grammar_test/components/grammar_example_card.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/jlpt_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/widgets/related_word.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';
import 'package:jonggack_toeic_japanese/repository/kangis_step_repository.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';

// ignore: must_be_immutable
class WordCard extends StatelessWidget {
  WordCard(
      {super.key, required this.word, this.controller, this.fnMyWordDelete});
  JlptStepController? controller;
  final Function? fnMyWordDelete;
  final Word word;
  @override
  Widget build(BuildContext context) {
    List<String> temp = [];
    String japanese = word.word;
    KangiStepRepositroy kangiStepRepositroy = KangiStepRepositroy();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.width10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.height11,
            horizontal: Responsive.width14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: KangiText(
                            japanese: japanese,
                            clickTwice: false,
                          ),
                        ),
                        if (controller != null)
                          IconButton(
                            onPressed: () => controller!.toggleSaveWord(word),
                            icon: FaIcon(
                              !controller!.isSavedInLocal(word)
                                  ? FontAwesomeIcons.bookmark
                                  : FontAwesomeIcons.solidBookmark,
                              color: AppColors.mainBordColor,
                              size: Responsive.height10 * 2.2,
                            ),
                          )
                      ],
                    ),
                  ),
                  if (fnMyWordDelete != null)
                    IconButton(
                      onPressed: () {
                        fnMyWordDelete!();
                      },
                      icon: Icon(
                        Icons.delete,
                        size: Responsive.height10 * 3,
                      ),
                    )
                ],
              ),
              SizedBox(height: Responsive.height10),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '[${word.yomikata}]',
                      style: TextStyle(
                        fontSize: Responsive.height20,
                        fontWeight: FontWeight.w800,
                        fontFamily: AppFonts.japaneseFont,
                      ),
                    ),
                  ),
                  SizedBox(width: Responsive.width10 / 2),
                  GetBuilder<TtsController>(
                    builder: (ttsController) {
                      return IconButton(
                        onPressed: () =>
                            ttsController.speak(word.word, language: 'en-US'),
                        icon: FaIcon(
                          ttsController.isPlaying
                              ? FontAwesomeIcons.volumeLow
                              : FontAwesomeIcons.volumeOff,
                          color: AppColors.mainBordColor,
                          size: Responsive.height10 * 2.6,
                        ),
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: Responsive.height10),
              Text(
                word.mean,
                style: TextStyle(
                  fontSize: Responsive.height18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Divider(),
              SizedBox(height: Responsive.height10 * 1.5),
              SizedBox(height: Responsive.height10 * 2),
              if (word.examples != null && word.examples!.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '例文',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.height10 * 1.8,
                        color: AppColors.mainBordColor,
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Get.to(
                    //       () => GrammarDetailScreen(
                    //         examples: word.examples!,
                    //       ),
                    //     );
                    //   },
                    //   child: Text(
                    //     '셈플 발음 테스트하기→',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: Responsive.height10 * 1.8,
                    //       color: AppColors.mainBordColor,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                if (controller == null)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: Responsive.height16 / 2),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            word.examples!.length,
                            (index) {
                              return GrammarExampleCard(
                                examples: word.examples!,
                                index: index,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                else ...[
                  Expanded(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Responsive.height16 / 2),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!controller!.isMoreExample) ...[
                              if (word.examples!.length > 2) ...[
                                ...List.generate(2, (index) {
                                  return GrammarExampleCard(
                                    examples: word.examples!,
                                    index: index,
                                  );
                                }),
                                InkWell(
                                  onTap: controller!.onTapMoreExample,
                                  child: Text(
                                    '例文をもっと見る...',
                                    style: TextStyle(
                                      fontSize: Responsive.height15,
                                      color: AppColors.mainBordColor,
                                    ),
                                  ),
                                )
                              ] else ...[
                                ...List.generate(
                                  word.examples!.length,
                                  (index) {
                                    return GrammarExampleCard(
                                      examples: word.examples!,
                                      index: index,
                                    );
                                  },
                                )
                              ]
                            ] else ...[
                              ...List.generate(
                                word.examples!.length,
                                (index) {
                                  return GrammarExampleCard(
                                    examples: word.examples!,
                                    index: index,
                                  );
                                },
                              ),
                            ]
                          ]),
                    ),
                  ))
                ]
              ]
            ],
          ),
        ),
      ),
    );
  }
}
