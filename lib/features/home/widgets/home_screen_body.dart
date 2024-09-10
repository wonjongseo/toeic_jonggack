import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/learn_toeic_grammar_screen.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/toeic_question_step_screen.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_question_test_screen.dart';
import 'package:jonggack_toeic_japanese/common/widget/animated_circular_progressIndicator.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/basic/hiragana/screens/hiragana_screen.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/study_category_and_progress.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_home/screens/jlpt_home_screen.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';

import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/level_category_card.dart';
import 'package:jonggack_toeic_japanese/features/my_voca/screens/my_voca_sceen.dart';
import 'package:jonggack_toeic_japanese/features/my_voca/services/my_voca_controller.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';

enum KindOfStudy { BASIC, JLPT, MY }

extension KindOfStudyExtension on KindOfStudy {
  String get value {
    switch (this) {
      case KindOfStudy.BASIC:
        return '文法帳';
      case KindOfStudy.JLPT:
        return '単語帳';
      case KindOfStudy.MY:
        return '自分の単語帳';
    }
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key, required this.index});

  final int index;

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> bodys = const [
    BasicCard(),
    JLPTCards(),
    MyCards(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return bodys[widget.index];
    });
  }
}

class JLPTCards extends StatefulWidget {
  const JLPTCards({super.key});

  @override
  State<JLPTCards> createState() => _JLPTCardsState();
}

class _JLPTCardsState extends State<JLPTCards> {
  int _currentIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _currentIndex = LocalReposotiry.getBasicOrJlptOrMyDetail(KindOfStudy.JLPT);
  }

  @override
  void dispose() {
    LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.JLPT, _currentIndex);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          disableCenter: true,
          viewportFraction: userController.user.isPad ? 0.55 : 0.75,
          enableInfiniteScroll: false,
          initialPage: _currentIndex,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            _currentIndex = index;
          },
          scrollDirection: Axis.horizontal,
        ),
        items: [
          LevelCategoryCard(
            titleSize: Responsive.width10 * 3,
            title: '500点向け',
            onTap: () {
              Get.to(
                () => JlptHomeScreen(title: '500点向け', index: 0, level: '500'),
              );
            },
            body: Column(
              children: [
                StudyCategoryAndProgress(
                  caregory: '単語',
                  curCnt: userController.user.currentJlptWordScroes[0],
                  totalCnt: userController.user.jlptWordScroes[0],
                ),
                StudyCategoryAndProgress(
                  caregory: '慣用句',
                  curCnt: userController.user.currentKangiScores[0],
                  totalCnt: userController.user.kangiScores[0],
                )
              ],
            ),
            foot: const Text(
              '500点を目指している方向けのTOEIC単語帳',
            ),
          ),
          LevelCategoryCard(
            titleSize: Responsive.width10 * 3,
            title: '700点向け',
            onTap: () {
              Get.to(() =>
                  JlptHomeScreen(title: '700点向け', index: 1, level: '700'));
            },
            body: Column(
              children: [
                StudyCategoryAndProgress(
                  caregory: '単語',
                  curCnt: userController.user.currentJlptWordScroes[1],
                  totalCnt: userController.user.jlptWordScroes[1],
                ),
                StudyCategoryAndProgress(
                  caregory: '慣用句',
                  curCnt: userController.user.currentKangiScores[1],
                  totalCnt: userController.user.kangiScores[1],
                ),
              ],
            ),
            foot: const Text(
              '700点を目指している方向けのTOEIC単語帳',
            ),
          ),
          LevelCategoryCard(
            titleSize: Responsive.width10 * 3,
            title: '900点向け',
            onTap: () {
              Get.to(() =>
                  JlptHomeScreen(title: '900点向け', index: 2, level: '900'));
            },
            body: Column(
              children: [
                StudyCategoryAndProgress(
                  caregory: '進捗',
                  curCnt: userController.user.currentJlptWordScroes[2],
                  totalCnt: userController.user.jlptWordScroes[2],
                ),
                StudyCategoryAndProgress(
                  caregory: '慣用句',
                  curCnt: userController.user.currentKangiScores[2],
                  totalCnt: userController.user.kangiScores[2],
                ),
              ],
            ),
            foot: const Text('900点を目指している方向けのTOEIC単語帳'),
          ),
          LevelCategoryCard(
            titleSize: Responsive.width10 * 3,
            title: '単語3000個',
            onTap: () {
              Get.to(() =>
                  JlptHomeScreen(title: '単語3000個', index: 3, level: '1~300'));
            },
            body: StudyCategoryAndProgress(
              caregory: '単語',
              curCnt: userController.user.currentJlptWordScroes[3],
              totalCnt: userController.user.jlptWordScroes[3],
            ),
            foot: const Text('以前TOEIC試験から出題された\nTOEIC単語3000選'),
          ),
        ],
      );
    });
  }

  void onPageChanged(v) {
    _currentIndex =
        LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.JLPT, v);
    setState(() {});
  }
}

class MyCards extends StatefulWidget {
  const MyCards({
    super.key,
  });

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  CarouselController carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = LocalReposotiry.getBasicOrJlptOrMyDetail(KindOfStudy.MY);

    bodys = [];
  }

  @override
  void dispose() {
    super.dispose();
    _currentIndex =
        LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.MY, _currentIndex);
  }

  List<Widget> bodys = [];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          disableCenter: true,
          viewportFraction: userController.user.isPad ? 0.55 : 0.75,
          enableInfiniteScroll: false,
          initialPage: _currentIndex,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            _currentIndex =
                LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.MY, index);
          },
          scrollDirection: Axis.horizontal,
        ),
        items: [
          LevelCategoryCard(
            onTap: () {
              LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.MY, 0);
              Get.toNamed(
                MY_VOCA_PATH,
                arguments: {
                  MY_VOCA_TYPE: MyVocaEnum.YOKUMATIGAERU_WORD,
                },
              );
            },
            title: '自分の単語帳①',
            extraInfo: RichText(
              text: TextSpan(
                text: '保存した単語：',
                children: [
                  TextSpan(
                    text: "${userController.user.yokumatigaeruMyWords}",
                    style: TextStyle(
                      color: AppColors.mainBordColor,
                    ),
                  ),
                  const TextSpan(text: "個")
                ],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Responsive.width10 * 1.4,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.japaneseFont,
                ),
              ),
            ),
            titleSize: Responsive.width10 * 2.3,
            foot: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '一番TOEICアプリから保存した\n単語を学習する単語帳',
                style: TextStyle(
                  fontSize: Responsive.width15,
                ),
              ),
            ),
          ),
          LevelCategoryCard(
            onTap: () {
              LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.MY, 1);
              Get.toNamed(
                MY_VOCA_PATH,
                arguments: {MY_VOCA_TYPE: MyVocaEnum.MANUAL_SAVED_WORD},
              );
            },
            title: '自分の単語帳②',
            titleSize: Responsive.width10 * 2.3,
            extraInfo: RichText(
              text: TextSpan(
                text: '保存した単語：',
                children: [
                  TextSpan(
                    text: "${userController.user.manualSavedMyWords}",
                    style: TextStyle(
                      color: AppColors.mainBordColor,
                    ),
                  ),
                  const TextSpan(text: "個")
                ],
                style: TextStyle(
                  fontSize: Responsive.width10 * 1.4,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.japaneseFont,
                ),
              ),
            ),
            foot: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ユーザーが直接に保存した\n単語を学習する単語帳',
                style: TextStyle(
                  fontSize: Responsive.height15,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  void onPageChanged(v) {
    _currentIndex = LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.MY, v);
    setState(() {});
  }
}

class BasicCard extends StatefulWidget {
  const BasicCard({super.key});

  @override
  State<BasicCard> createState() => _BasicCardState();
}

class _BasicCardState extends State<BasicCard> {
  CarouselController carouselController = CarouselController();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = LocalReposotiry.getBasicOrJlptOrMyDetail(KindOfStudy.BASIC);
  }

  @override
  void dispose() {
    super.dispose();
    LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.BASIC, _currentIndex);
  }

  void onPageChanged(v) {
    _currentIndex =
        LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.BASIC, v);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userController) {
      return CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            disableCenter: true,
            viewportFraction: userController.user.isPad ? 0.55 : 0.75,
            enableInfiniteScroll: false,
            initialPage: _currentIndex,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              _currentIndex = LocalReposotiry.putBasicOrJlptOrMyDetail(
                  KindOfStudy.BASIC, index);
            },
            scrollDirection: Axis.horizontal,
          ),
          items: [
            LevelCategoryCard(
              onTap: () {
                LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.BASIC, 0);

                Get.to(() => const LearnToeicGrammarScreen());
              },
              title: '文法学習',
              titleSize: Responsive.width10 * 2.3,
              foot: Text(
                'TOEICから高得点するために、知っておかないといけない文法事項54選',
                style: TextStyle(
                  fontSize: Responsive.width14,
                ),
              ),
            ),
            LevelCategoryCard(
              onTap: () {
                LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.BASIC, 1);
                Get.to(() => const ToeicQuestionStepScreen());
              },
              title: 'Chapter５問題帳',
              body: Column(
                children: [
                  StudyCategoryAndProgress(
                    caregory: '単語',
                    curCnt: userController.user.currentGrammarScores[0],
                    totalCnt: userController.user.grammarScores[0],
                  ),
                ],
              ),
              titleSize: Responsive.width10 * 2.3,
              foot: Text(
                'Chapter5の練習問題1195選',
                style: TextStyle(fontSize: Responsive.height15),
              ),
            )
          ]);
    });
  }
}
