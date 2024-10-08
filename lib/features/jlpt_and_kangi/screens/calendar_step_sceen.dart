import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';

import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/grammar_step/services/grammar_controller.dart';
import 'package:jonggack_toeic_japanese/features/grammar_step/widgets/grammar_study_screen.dart';
import 'package:jonggack_toeic_japanese/features/grammar_test/grammar_test_screen.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/jlpt_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/kangi/controller/kangi_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/widgets/step_selector_button.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_home/screens/jlpt_home_screen.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/screens/jlpt_study_sceen.dart';
import 'package:jonggack_toeic_japanese/features/kangi_study/widgets/screens/kangi_study_sceen.dart';
import 'package:jonggack_toeic_japanese/model/jlpt_step.dart';
import 'package:jonggack_toeic_japanese/model/kangi.dart';
import 'package:jonggack_toeic_japanese/model/kangi_step.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';

const String JLPT_CALENDAR_STEP_PATH = '/jlpt-calendar-step';

// ignore: must_be_immutable
class CalendarStepSceen extends StatefulWidget {
  late CategoryEnum categoryEnum;

  CalendarStepSceen({super.key}) {
    categoryEnum = Get.arguments['categoryEnum'];
  }

  @override
  State<CalendarStepSceen> createState() => _CalendarStepSceenState();
}

class _CalendarStepSceenState extends State<CalendarStepSceen> {
  int currChapNumber = 0;
  UserController userController = Get.find<UserController>();
  late PageController pageController;
  List<GlobalKey> gKeys = [];
  late JlptStepController jlptWordController;
  late KangiStepController kangiController;
  late GrammarController grammarController;

  late String level;
  late String chapter;
  late String category;
  @override
  void initState() {
    super.initState();
    chapter = Get.arguments['chapter'];

    switch (widget.categoryEnum) {
      case CategoryEnum.Japaneses:
        category = '単語';
        jlptWordController = Get.find<JlptStepController>();

        level = jlptWordController.level;
        jlptWordController.setJlptSteps(chapter);

        gKeys = List.generate(
            jlptWordController.jlptSteps.length, (index) => GlobalKey());

        jlptWordController.pageController =
            PageController(initialPage: jlptWordController.currChapNumber);

        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            Scrollable.ensureVisible(
                gKeys[jlptWordController.currChapNumber].currentContext!,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut);
          },
        );

        break;

      case CategoryEnum.Kangis:
        category = '慣用句';
        kangiController = Get.find<KangiStepController>();
        level = kangiController.level;

        kangiController.setKangiSteps(chapter);

        gKeys = List.generate(
            kangiController.kangiSteps.length, (index) => GlobalKey());

        kangiController.pageController =
            PageController(initialPage: kangiController.step);

        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            Scrollable.ensureVisible(
                gKeys[kangiController.step].currentContext!,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeInOut);
          },
        );
        break;
      case CategoryEnum.Grammars:
        category = '文法';
        grammarController = Get.find<GrammarController>();
        level = grammarController.level;
        break;
    }
    print('category : ${category}');
  }

  Widget getBody(CategoryEnum categoryEnum) {
    switch (categoryEnum) {
      case CategoryEnum.Japaneses:
        return GetBuilder<JlptStepController>(builder: (controller) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Responsive.height10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        controller.jlptSteps.length,
                        (index) {
                          bool isEnabled = false;
                          if (index == 0) {
                            isEnabled = true;
                          } else {
                            isEnabled =
                                (controller.jlptSteps[index - 1].isFinished ??
                                    false);
                          }
                          // For Development
                          // if (!kReleaseMode) {
                          //   isEnabled = true;
                          // }
                          return Padding(
                            key: gKeys[index],
                            padding: EdgeInsets.only(
                              left: Responsive.height10 * 0.8,
                            ),
                            child: InkWell(
                              onTap: () async {
                                if (!isEnabled) {
                                  if (await CommonDialog
                                      .alertPreviousTestRequired()) {
                                    jlptWordController.goToTest();
                                  }
                                  return;
                                }
                                jlptWordController.changeHeaderPageIndex(index);

                                setState(() {});
                              },
                              child: StepSelectorButton(
                                isCurrent: jlptWordController.step == index,
                                isFinished:
                                    controller.jlptSteps[index].isFinished ??
                                        false,
                                isEnabled: isEnabled,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Responsive.height16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Transform.scale(
                                scale: userController.user.isPad ? 2 : 1,
                                child: Checkbox(
                                  value: !controller.isSeeMean,
                                  onChanged: (v) => controller.toggleSeeMean(v),
                                  checkColor: Colors.cyan.shade600,
                                  fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '意味を隠す',
                                style: TextStyle(
                                  fontSize: Responsive.width12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          if (controller.getJlptStep().words.length >= 4)
                            Card(
                              child: InkWell(
                                onTap: () => jlptWordController.goToTest(),
                                child: Padding(
                                  padding: EdgeInsets.all(Responsive.width10),
                                  child: Text(
                                    'テスト',
                                    style: TextStyle(
                                      fontSize: Responsive.width14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.cyan.shade600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          Transform.scale(
                            scale: userController.user.isPad ? 2 : 1,
                            child: Checkbox(
                              value: controller.isAllSave(),
                              onChanged: (v) => controller.toggleAllSave(),
                              checkColor: Colors.cyan.shade600,
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.white),
                            ),
                          ),
                          Text(
                            '全部選択',
                            style: TextStyle(
                              fontSize: Responsive.width12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Responsive.height8),
                    child: Container(
                      color: Colors.white,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: jlptWordController.pageController,
                        itemCount: controller.jlptSteps.length,
                        itemBuilder: (context, subStep) {
                          JlptStep toeicWordStep =
                              controller.jlptSteps[controller.step];

                          return SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                toeicWordStep.words.length,
                                (index) {
                                  bool isSaved = controller.isSavedInLocal(
                                      toeicWordStep.words[index]);
                                  return BBBB(
                                    word: toeicWordStep.words[index],
                                    index: index,
                                    isSaved: isSaved,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });

      case CategoryEnum.Kangis:
        return GetBuilder<KangiStepController>(builder: (controller) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Responsive.height10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          List.generate(controller.kangiSteps.length, (index) {
                        bool isEnabled = false;
                        if (index == 0) {
                          isEnabled = true;
                        } else {
                          isEnabled =
                              (controller.kangiSteps[index - 1].isFinished ??
                                  false);
                        }

                        // For Development
                        // if (!kReleaseMode) {
                        //   isEnabled = true;
                        // }

                        return Padding(
                          padding: EdgeInsets.only(
                            left: Responsive.height10 * 0.8,
                          ),
                          child: InkWell(
                            key: gKeys[index],
                            onTap: () async {
                              if (!isEnabled) {
                                if (await CommonDialog
                                    .alertPreviousTestRequired()) {
                                  kangiController.goToTest();
                                }
                                return;
                              }
                              kangiController.changeHeaderPageIndex(index);

                              setState(() {});
                            },
                            child: StepSelectorButton(
                              isCurrent: kangiController.step == index,
                              isFinished:
                                  controller.kangiSteps[index].isFinished ??
                                      false,
                              isEnabled: isEnabled,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Responsive.height16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Transform.scale(
                                scale: userController.user.isPad ? 2 : 1,
                                child: Checkbox(
                                  value: controller.isHidenMean,
                                  onChanged: (v) => controller.toggleSeeMean(v),
                                  checkColor: Colors.cyan.shade600,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      (states) => Colors.white),
                                ),
                              ),
                              Text(
                                '意味を隠す',
                                style: TextStyle(
                                  fontSize: Responsive.width12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                          if (controller.getKangiStep().kangis.length >= 4)
                            Card(
                              shape: const CircleBorder(),
                              child: InkWell(
                                onTap: () => kangiController.goToTest(),
                                child: Padding(
                                  padding: EdgeInsets.all(Responsive.width10),
                                  child: Text(
                                    'テスト',
                                    style: TextStyle(
                                      fontSize: Responsive.width12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.cyan.shade600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        children: [
                          Transform.scale(
                            scale: userController.user.isPad ? 2 : 1,
                            child: Checkbox(
                              value: controller.isAllSave(),
                              onChanged: (v) => controller.toggleAllSave(),
                              checkColor: Colors.cyan.shade600,
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.white),
                            ),
                          ),
                          Text(
                            '全部選択',
                            style: TextStyle(
                              fontSize: Responsive.width12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Responsive.height8),
                    child: Container(
                      color: Colors.white,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: kangiController.pageController,
                        itemCount: controller.kangiSteps.length,
                        itemBuilder: (context, subStep) {
                          controller.setStep(subStep);
                          KangiStep kangiStep = controller.getKangiStep();

                          return SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                kangiStep.kangis.length,
                                (index) {
                                  bool isSaved = controller
                                      .isSavedInLocal(kangiStep.kangis[index]);
                                  return CCCC(
                                    kangi: kangiStep.kangis[index],
                                    index: index,
                                    isSaved: isSaved,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });

      case CategoryEnum.Grammars:
        return GetBuilder<GrammarController>(
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Responsive.height16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Checkbox(
                                value: !controller.isSeeMean,
                                onChanged: (v) => controller.toggleSeeMean(v),
                                checkColor: Colors.cyan.shade600,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => Colors.white),
                              ),
                              Text(
                                '의미 가리기',
                                style: TextStyle(
                                  fontSize: Responsive.height14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: Responsive.width20),
                      if (controller.getGrammarStep().grammars.length >= 4)
                        Card(
                          shape: const CircleBorder(),
                          child: InkWell(
                            onTap: () async {
                              return Get.toNamed(
                                GRAMMAR_TEST_SCREEN,
                                arguments: {
                                  'grammar':
                                      controller.getGrammarStep().grammars,
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(Responsive.width10),
                              child: Text(
                                '퀴즈!',
                                style: TextStyle(
                                  fontSize: Responsive.height14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.cyan.shade600,
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Responsive.height8),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            controller.getGrammarStep().grammars.length,
                            (index) {
                              return GrammarStudyScreen(
                                index: index,
                                grammars: controller.getGrammarStep().grammars,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('widget.categoryEnum : ${widget.categoryEnum}');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text(
            '$level点ー$categoryーChapter${int.parse(chapter) + 1}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: appBarTextSize,
            ),
          ),
        ),
      ),
      body: SafeArea(child: getBody(widget.categoryEnum)),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}

class BBBB extends StatefulWidget {
  const BBBB({
    Key? key,
    required this.isSaved,
    required this.index,
    required this.word,
  }) : super(key: key);
  final bool isSaved;
  final int index;
  final Word word;

  @override
  State<BBBB> createState() => _BBBBState();
}

class _BBBBState extends State<BBBB> {
  UserController userController = Get.find<UserController>();
  JlptStepController controller = Get.find<JlptStepController>();
  bool isWantToSeeMean = false;

  @override
  Widget build(BuildContext context) {
    String mean = widget.word.mean;
    String changedWord = widget.word.word;

    return InkWell(
        onTap: () => Get.to(() => JlptStudyScreen(currentIndex: widget.index)),
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 0.3)),
          child: ListTile(
            // isThreeLine: true,
            minLeadingWidth: Responsive.height10 * 8,
            // subtitle:
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AutoSizeText(
                    changedWord,
                    style: TextStyle(
                      fontSize: Responsive.height10 * 1.8,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.japaneseFont,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Responsive.height10 * 3,
                        child: isWantToSeeMean || controller.isSeeMean
                            ? Text(
                                mean,
                                style: TextStyle(
                                  fontSize: Responsive.width18,
                                  fontFamily: AppFonts.japaneseFont,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  isWantToSeeMean = true;
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400),
                                ),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Responsive.height16 / 2,
                        ),
                        child: SizedBox(
                            height: Responsive.height10 * 3,
                            child: AutoSizeText(
                              widget.word.yomikata,
                              style: TextStyle(
                                fontSize: Responsive.width15,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxFontSize: 1,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            trailing: IconButton(
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(2),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: FaIcon(
                widget.isSaved
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: widget.isSaved ? AppColors.mainBordColor : null,
                size: Responsive.height10 * 2.2,
              ),
              onPressed: () => controller.toggleSaveWord(widget.word),
            ),
          ),
        ));
  }
}

class CCCC extends StatefulWidget {
  const CCCC({
    super.key,
    required this.kangi,
    required this.index,
    required this.isSaved,
  });
  final int index;
  final Kangi kangi;
  final bool isSaved;
  @override
  State<CCCC> createState() => _CCCCState();
}

class _CCCCState extends State<CCCC> {
  bool isWantToSeeMean = false;
  bool isWantToSeeUndoc = false;
  bool isWantToSeeHundoc = false;
  UserController userController = Get.find<UserController>();
  KangiStepController controller = Get.find<KangiStepController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => KangiStudySceen(currentIndex: widget.index)),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 0.3)),
        child: ListTile(
          subtitle: const Text(''),
          dense: true,
          minLeadingWidth: Responsive.height10 * 15,
          isThreeLine: true,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: Responsive.height10 * 5,
              child: isWantToSeeMean || !controller.isHidenMean
                  ? Text(
                      widget.kangi.mean,
                      style: TextStyle(
                        fontSize: userController.user.isPad
                            ? Responsive.height14
                            : Responsive.width14,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.japaneseFont,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        isWantToSeeMean = true;
                        setState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 15,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
          leading: Column(
            children: [
              Text(
                widget.kangi.word,
                style: TextStyle(
                  fontSize: userController.user.isPad
                      ? Responsive.height18
                      : Responsive.width18,
                  color: Colors.black,
                  fontFamily: AppFonts.japaneseFont,
                ),
              ),
            ],
          ),
          trailing: IconButton(
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(2),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: FaIcon(
                widget.isSaved
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: widget.isSaved ? AppColors.mainBordColor : null,
                size: Responsive.height10 * 2.2,
              ),
              onPressed: () => controller.toggleSaveWord(widget.kangi)),
        ),
      ),
    );
  }
}
