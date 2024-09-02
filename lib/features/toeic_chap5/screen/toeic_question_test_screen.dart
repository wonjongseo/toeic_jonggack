import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/components/toeic_question_back_card.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/components/toeic_question_front_card.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

class ToeicQuestionTestScreen extends StatefulWidget {
  const ToeicQuestionTestScreen({super.key});

  @override
  State<ToeicQuestionTestScreen> createState() =>
      _ToeicQuestionTestScreenState();
}

class _ToeicQuestionTestScreenState extends State<ToeicQuestionTestScreen>
    with SingleTickerProviderStateMixin {
  CarouselController carouselController = CarouselController();
  late ToeicQuestionTestController tQTestcontroller;
  @override
  void initState() {
    super.initState();

    tQTestcontroller = Get.put(ToeicQuestionTestController());

    tQTestcontroller.anmationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToeicQuestionTestController>(builder: (controller) {
      List<ToeicQuestion> questions =
          controller.toeicQuestionStepController.getJlptStep().toeicQuestions;
      // List<ToeicQuestion> questions = controller.toeicQuestionStepController
      //     .getJlptStep()
      //     .toeicQuestions
      //     .where((e) {
      //   if (e.wasCorrected == true) {
      //     return false;
      //   }
      //   return true;
      // }).toList();
      print('questions.length : ${questions.length}');

      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(appBarHeight),
          child: AppBar(
            title: CustomAppBarTitle(
              curIndex: controller.currentPageIndex + 1,
              totalIndex: questions.length,
            ),
            actions: [
              if (controller.isSubmitted)
                TextButton(
                  onPressed: () {
                    if (controller.isLastQuestion()) {
                      controller.submit();
                    } else {
                      controller.pageController.animateToPage(
                          controller.currentPageIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    controller.actionString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBordColor,
                    ),
                  ),
                )
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(Responsive.height10),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                return Center(
                  child: AnimatedBuilder(
                    animation: tQTestcontroller.anmationController,
                    builder: (context, child) {
                      final angle =
                          tQTestcontroller.anmationController.value * 3.14159;
                      final isUnder = angle > 3.14159 / 2;
                      return Transform(
                        transform: Matrix4.rotationY(angle),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            ToeicQuestionFrontCard(
                              isUnder: isUnder,
                              question: questions[index],
                            ),
                            ToeicQuestionBackCard(
                              isUnder: isUnder,
                              question: questions[index],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
