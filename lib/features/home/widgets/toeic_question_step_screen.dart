import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/search/widgets/search_widget.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/screen/toeic_question_test_screen.dart';

class ToeicQuestionStepScreen extends StatefulWidget {
  const ToeicQuestionStepScreen({super.key});

  @override
  State<ToeicQuestionStepScreen> createState() =>
      _ToeicQuestionStepScreenState();
}

class _ToeicQuestionStepScreenState extends State<ToeicQuestionStepScreen> {
  int progrssingIndex = 0;
  // int stepIndex = 0;
  late PageController pageController;
  ToeicQuestionStepController toeicQSController =
      Get.put(ToeicQuestionStepController(level: '1'));

  @override
  void initState() {
    //TODO
    // get last Step Index
    // toeicQSController.setSteps(stepIndex.toString());

    pageController = PageController(initialPage: toeicQSController.outStep);
    super.initState();
  }

  onPageChanged(int newPage) {
    toeicQSController.setOutStep(newPage.toString());

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
          title: const Text('Chapter5問題帳'),
        ),
      ),
      body: GetBuilder<ToeicQuestionStepController>(builder: (controller) {
        return SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.width20),
              child: Column(
                children: [
                  SizedBox(height: Responsive.height10 * 2),
                  const NewSearchWidget(),
                  Padding(
                    padding: EdgeInsets.all(Responsive.height10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                            controller.totalStepCount,
                            (index) => TextButton(
                                  onPressed: () {
                                    controller.setOutStep(index.toString());

                                    pageController.animateToPage(
                                      controller.outStep,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: controller.outStep == index
                                          ? Border(
                                              bottom: BorderSide(
                                                width: Responsive.width10 * 0.3,
                                                color: Colors.cyan.shade600,
                                              ),
                                            )
                                          : null,
                                    ),
                                    child: Text(
                                      'Step${index + 1}',
                                      style: index == controller.outStep
                                          ? TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.cyan.shade600,
                                              fontSize: Responsive.height17,
                                            )
                                          : TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: Responsive.height15,
                                            ),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.totalStepCount,
                      controller: pageController,
                      onPageChanged: onPageChanged,
                      itemBuilder: (context, index) {
                        return CarouselSlider(
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            disableCenter: true,
                            initialPage: controller.inStep,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              controller.setInStep(index);
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                          items: List.generate(
                            controller.jlptSteps.length,
                            (inStep) {
                              return InkWell(
                                onTap: () => controller.getToTestScreen(inStep),
                                child: Card(
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              Responsive.height10),
                                          child: Text(
                                            '${controller.getJlptStep().scores} / ${controller.getJlptStep().toeicQuestions.length}\n${controller.getTestProgress(inStep)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Responsive.width18,
                                              color: controller
                                                  .getTestColor(inStep),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                'Step${controller.outStep + 1}\n',
                                            children: [
                                              TextSpan(
                                                text: '${inStep + 1}番のテスト\n',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      Responsive.width10 * 2.8,
                                                  color:
                                                      AppColors.mainBordColor,
                                                ),
                                              ),
                                            ],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Responsive.width22,
                                              color: AppColors.mainBordColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
