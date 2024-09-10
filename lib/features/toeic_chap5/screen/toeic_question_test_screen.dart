import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';

import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_question_test_controller.dart';
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
          controller.toeicQuestionStepController.questions;

      return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(appBarHeight),
        //   child: AppBar(
        //     title: CustomAppBarTitle(
        //       curIndex: controller.currentPageIndex + 1,
        //       totalIndex: questions.length,
        //     ),
        //     actions: [
        //       if (controller.isSubmitted)
        //         TextButton(
        //           onPressed: () {
        //             if (controller.isLastQuestion()) {
        //               controller.submit();
        //             } else {
        //               controller.pageController.animateToPage(
        //                   controller.currentPageIndex + 1,
        //                   duration: const Duration(milliseconds: 500),
        //                   curve: Curves.easeInOut);
        //             }
        //           },
        //           child: Text(
        //             controller.actionString(),
        //             style: TextStyle(
        //               fontWeight: FontWeight.bold,
        //               color: AppColors.mainBordColor,
        //             ),
        //           ),
        //         )
        //     ],
        //   ),
        // ),
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Responsive.height10).copyWith(
              top: Responsive.height10,
            ),
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
                      return Column(
                        children: [
                          Expanded(
                            child: Transform(
                              transform: Matrix4.rotationY(angle),
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  ToeicQuestionFrontCard(
                                    isUnder: isUnder,
                                    index: index,
                                    question: questions[index],
                                  ),
                                  ToeicQuestionBackCard(
                                    isUnder: isUnder,
                                    question: questions[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Responsive.width24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => tQTestcontroller.exitText(),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '出る',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.width18,
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        shape: const CircleBorder(),
                        child: Container(
                          // width: 40,
                          // height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: InkWell(
                            onTap: () {
                              controller.clickNextOrSkip();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(Responsive.height15),
                              child: Center(
                                  child: Text(
                                controller.actionString(),
                                style: const TextStyle(
                                  fontFamily: AppFonts.japaneseFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomAppBarTitle(
                        curIndex: controller.currentPageIndex + 1,
                        totalIndex: questions.length,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Responsive.height10),
              if (1 == 2)
                Container(
                  child: PreferredSize(
                    preferredSize: const Size.fromHeight(appBarHeight),
                    child: AppBar(
                      title: CustomAppBarTitle(
                        curIndex: controller.currentPageIndex + 1,
                        totalIndex: questions.length,
                      ),
                      actions: [],
                    ),
                  ),
                ),
              const GlobalBannerAdmob(),
            ],
          ),
        ),
      );
    });
  }
}
