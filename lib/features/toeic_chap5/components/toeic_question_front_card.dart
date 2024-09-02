import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

class ToeicQuestionFrontCard extends StatelessWidget {
  const ToeicQuestionFrontCard({
    super.key,
    required this.isUnder,
    required this.question,
  });

  final bool isUnder;
  final ToeicQuestion question;

  @override
  Widget build(BuildContext context) {
    ToeicQuestionTestController tQTestcontroller =
        Get.find<ToeicQuestionTestController>();

    return Visibility(
      visible: !isUnder,
      child: Transform(
        transform: Matrix4.rotationY(isUnder ? 3.14159 : 0),
        alignment: Alignment.center,
        child: InkWell(
          onTap: tQTestcontroller.isSubmitted
              ? () => tQTestcontroller.flipCard()
              : null,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(Responsive.height10 * 2),
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
                            onTap: tQTestcontroller.isSubmitted
                                ? null
                                : () {
                                    tQTestcontroller
                                        .clickOneOfTheAnswers(index2);
                                  },
                            child: Text(
                              question.answers[index2],
                              style: TextStyle(
                                fontSize: Responsive.width18,
                                color: tQTestcontroller.getColor(index2),
                                fontWeight: tQTestcontroller.getFontWeight(
                                    question, index2),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (tQTestcontroller.isSubmitted) ...[
                    Divider(height: Responsive.height25),
                    Text(
                      '正解：${question.answer}',
                      style: TextStyle(
                          fontSize: Responsive.height20,
                          fontWeight: FontWeight.bold,
                          color: tQTestcontroller
                              .getColor(tQTestcontroller.selectedIndex2)),
                    ),
                    SizedBox(height: Responsive.height10),
                    Text(
                      question.mean,
                      style: TextStyle(
                        fontSize: Responsive.width15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Divider(height: Responsive.height25),
                    SizedBox(height: Responsive.height30),
                    InkWell(
                      onTap: () => tQTestcontroller.flipCard(),
                      child: Text(
                        'カードをクリックして説明を表示する...',
                        style: TextStyle(
                          fontSize: Responsive.width18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBordColor,
                        ),
                      ),
                    )
                  ],
                  if (question.wasCorrected != null &&
                      tQTestcontroller.toeicQuestionStepController
                              .getJlptStep()
                              .isFinished ==
                          true)
                    Text(question.wasCorrected == true ? "前回、解け済み" : "前回、間違い")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
