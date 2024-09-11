import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_question_test_controller.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

class ToeicQuestionFrontCard extends StatelessWidget {
  const ToeicQuestionFrontCard({
    super.key,
    required this.isUnder,
    required this.question,
    required this.index,
  });
  final int index;

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
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(Responsive.height10 * 2),
            child: InkWell(
              onTap: tQTestcontroller.isSubmitted
                  ? () => tQTestcontroller.flipCard()
                  : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      //TODO FIX
                      // Text(question.id),
                      SizedBox(height: Responsive.height10),
                      AutoSizeText(
                        '${index + 1}. ${question.question.replaceAll('——–', '_______')}',
                        style: TextStyle(
                          fontSize: Responsive.width18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 4,
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
                      //TODO FIX
                      // if (tQTestcontroller.isSubmitted || !kReleaseMode) ...[
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
                        ),
                      ],
                    ],
                  ),
                  if (question.wasCorrected != null) ...[
                    // SizedBox(height: Responsive.height30),
                    if (question.lateUpdate != null)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${question.lateUpdate!.month}月${question.lateUpdate!.day}日${question.lateUpdate!.hour}時${question.lateUpdate!.minute}分に',
                                    style: TextStyle(
                                      fontSize: Responsive.width16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (question.wasCorrected == true)
                                    TextSpan(
                                      text: '解け済み',
                                      style: TextStyle(
                                        color: AppColors.mainBordColor,
                                        fontSize: Responsive.width18,
                                      ),
                                    )
                                  else
                                    TextSpan(
                                      text: '間違い',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: Responsive.width18,
                                      ),
                                    ),
                                ],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Responsive.width18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
