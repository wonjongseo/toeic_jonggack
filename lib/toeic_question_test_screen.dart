import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

class ToeicQuestionTestScreen extends StatefulWidget {
  const ToeicQuestionTestScreen({super.key});

  @override
  State<ToeicQuestionTestScreen> createState() =>
      _ToeicQuestionTestScreenState();
}

class _ToeicQuestionTestScreenState extends State<ToeicQuestionTestScreen> {
  late PageController pageController;
  int currentPageIndex = 0;
  CarouselController carouselController = CarouselController();
  late ToeicQuestionStepController controller;
  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: currentPageIndex);
    controller = Get.find<ToeicQuestionStepController>();
  }

  int selectedIndex2 = -1;
  int isProgrssing = 0;
  bool isSubmitted = false;
  bool isCorrect = false;
  String selectedAnswer = '';

  bool isOpenDescription = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(value) {
    isSubmitted = false;
    isCorrect = false;
    selectedAnswer = '';
    currentPageIndex = value;
    isOpenDescription = false;
    setState(() {});
  }

  int selectedIndex = 0;

  FontWeight? getFontWeight(ToeicQuestion tChapter, int index2) {
    Color? color = getColor(tChapter, index2);
    if (color == null || color! == Colors.black)
      return null;
    else {
      return FontWeight.bold;
    }
  }

  Color? getColor(ToeicQuestion tChapter, int index2) {
    if (selectedAnswer == '') {
      return null;
    } else {
      isSubmitted = true;
      selectedAnswer = tChapter.answers[index2];
      if (selectedAnswer.contains(tChapter.answer)) {
        isCorrect = true;
        return AppColors.mainBordColor;
      } else if (index2 == selectedIndex2) {
        isCorrect = false;
        return Colors.red;
      }
    }
    return Colors.black;
  }

  void checkAnswer(ToeicQuestion tChapter, int index2) {
    if (isSubmitted == false) {
      isSubmitted = true;
      selectedAnswer = tChapter.answers[index2];
      setState(() {});
    }
    selectedIndex2 = index2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<ToeicQuestion> questions = controller.getJlptStep().toeicQuestions;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
            title: CustomAppBarTitle(
          curIndex: currentPageIndex + 1,
          totalIndex: questions.length,
        )),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Responsive.height10),
          child: PageView.builder(
            itemCount: questions.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(Responsive.height10 * 2),
                  child: Column(
                    children: [
                      Text(
                        questions[index].question.replaceAll('——–', '_______'),
                        style: TextStyle(
                          fontSize: Responsive.width18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: Responsive.height8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          questions[index].answers.length,
                          (index2) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: InkWell(
                                onTap: () {
                                  checkAnswer(questions[index], index2);
                                },
                                child: Text(
                                  questions[index].answers[index2],
                                  style: TextStyle(
                                    fontSize: Responsive.width18,
                                    color: // 클릭한 것
                                        getColor(questions[index], index2),
                                    fontWeight:
                                        getFontWeight(questions[index], index2),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isSubmitted) ...[
                                SizedBox(height: Responsive.height10),
                                Text(
                                  '正解：${questions[index].answer}',
                                  style: TextStyle(
                                    fontSize: Responsive.height16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: Responsive.height8,
                                    bottom: Responsive.height16,
                                  ),
                                  child: Text(
                                    questions[index].mean,
                                    style: TextStyle(
                                        fontSize: Responsive.height16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                if (!isOpenDescription)
                                  InkWell(
                                    onTap: () {
                                      isOpenDescription = !isOpenDescription;
                                      setState(() {});
                                    },
                                    child: Text(
                                      '説明を見る...',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.mainBordColor,
                                      ),
                                    ),
                                  )
                                else
                                  HtmlWidget(
                                    questions[index].description,
                                    textStyle: TextStyle(
                                      fontFamily: AppFonts.japaneseFont,
                                      fontSize: Responsive.height17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    customStylesBuilder: (element) {
                                      if (element.classes.contains('bold')) {
                                        return {
                                          'color': 'red',
                                          'font-weight': 'bold',
                                        };
                                      }
                                      if (element.toString().contains('div')) {
                                        return {
                                          'padding': '0px',
                                          'font-size': '18px',
                                          // 'font-weight': 'bold',
                                        };
                                      }
                                      if (element.toString().contains('p')) {
                                        return {
                                          'padding': '0px',
                                          'font-size': '16px',
                                          // 'font-weight': 'bold',
                                        };
                                      }
                                      return null;
                                    },
                                  )
                              ],
                              // if (1 == 2)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
