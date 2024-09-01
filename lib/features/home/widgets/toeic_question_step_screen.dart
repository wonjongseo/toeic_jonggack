import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/search/widgets/search_widget.dart';
import 'package:jonggack_toeic_japanese/toeic_question_test_screen.dart';

class ToeicQuestionStepScreen extends StatefulWidget {
  const ToeicQuestionStepScreen({super.key});

  @override
  State<ToeicQuestionStepScreen> createState() =>
      _ToeicQuestionStepScreenState();
}

class _ToeicQuestionStepScreenState extends State<ToeicQuestionStepScreen> {
  int progrssingIndex = 0;
  int stepIndex = 0;
  late PageController pageController;
  ToeicQuestionStepController toeicQSController =
      Get.put(ToeicQuestionStepController(level: '1'));

  @override
  void initState() {
    //TODO
    // get last Step Index
    toeicQSController.setSteps(stepIndex.toString());

    pageController = PageController(initialPage: stepIndex);
    super.initState();
  }

  onPageChanged(int newPage) {
    stepIndex = newPage;
    toeicQSController.setSteps(stepIndex.toString());
    print('toeicQSController.step : ${toeicQSController.step}');

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
      body: SafeArea(
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
                          toeicQSController.totalStepCount,
                          (index) => TextButton(
                                onPressed: () {
                                  stepIndex = index;
                                  toeicQSController.setSteps(index.toString());

                                  pageController.animateToPage(
                                    stepIndex,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: stepIndex == index
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
                                    style: index == stepIndex
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
                    itemCount: toeicQSController.totalStepCount,
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, index) {
                      // print(
                      //     'toeicQSController.jlptSteps : ${toeicQSController.jlptSteps.length}');

                      return CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          disableCenter: true,
                          initialPage: progrssingIndex,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            progrssingIndex = index;
                            print('asdasd');
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                        items: List.generate(
                          toeicQSController.jlptSteps.length,
                          (indexOfStep) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const ToeicQuestionTestScreen());
                              },
                              child: Card(
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.all(Responsive.height10),
                                        child: Text(
                                          toeicQSController
                                              .getTestProgress(indexOfStep),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Responsive.width18,
                                              color: toeicQSController
                                                  .getTestColor(indexOfStep)),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Text.rich(
                                        TextSpan(
                                          text: 'Step${stepIndex + 1}\n',
                                          children: [
                                            TextSpan(
                                              text: '${indexOfStep + 1}番のテスト\n',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    Responsive.width10 * 2.8,
                                                color: AppColors.mainBordColor,
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
      ),
    );
  }
}
