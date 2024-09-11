import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/components/chapter5_description.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_question_test_screen.dart';

class ToeicScoreScreen extends StatefulWidget {
  const ToeicScoreScreen({super.key, required this.wrongToeicQuestions});

  final List<ToeicQuestion> wrongToeicQuestions;
  @override
  State<ToeicScoreScreen> createState() => _ToeicScoreScreenState();
}

class _ToeicScoreScreenState extends State<ToeicScoreScreen> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  bool isUnder = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
            title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBarTitle(
              curIndex: currentIndex + 1,
              totalIndex: widget.wrongToeicQuestions.length,
            ),
            Text(
              '誤答ノート',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: appBarTextSize,
              ),
            ),
          ],
        )),
      ),
      body: SafeArea(
        child: Center(
          child: PageView.builder(
            onPageChanged: onPageChanged,
            itemCount: widget.wrongToeicQuestions.length,
            itemBuilder: (context, index) {
              ToeicQuestion question = widget.wrongToeicQuestions[index];

              int correctIndex = -1;
              for (int i = 0; i < question.answers.length; i++) {
                if (question.answers[i].contains(question.answer)) {
                  correctIndex = i;
                  break;
                }
              }
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(Responsive.height10 * 2),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(question.id),
                        SizedBox(height: Responsive.height10),
                        Text(
                          question.question.replaceAll('——–', '_______'),
                          style: TextStyle(
                            fontSize: Responsive.width18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Responsive.height8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            question.answers.length,
                            (index2) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: InkWell(
                                  child: Text(
                                    question.answers[index2],
                                    style: TextStyle(
                                      fontSize: Responsive.width18,
                                      color: index2 == correctIndex
                                          ? AppColors.mainBordColor
                                          : null,
                                      fontWeight: index2 == correctIndex
                                          ? FontWeight.bold
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Text(
                          '正解：${question.answer}',
                          style: TextStyle(
                            fontSize: Responsive.height20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: Responsive.height10),
                        Text(
                          question.mean,
                          style: TextStyle(
                              fontSize: Responsive.height16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: Responsive.height30),
                        Chapter5Description(description: question.description),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void onPageChanged(value) {
    currentIndex = value;
    setState(() {});
  }
}
