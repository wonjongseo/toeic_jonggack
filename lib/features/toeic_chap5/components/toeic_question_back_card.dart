import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_question_test_controller.dart';
import 'package:jonggack_toeic_japanese/features/toeic_chap5/components/chapter5_description.dart';
import 'package:jonggack_toeic_japanese/model/toeic_question.dart';

class ToeicQuestionBackCard extends StatelessWidget {
  const ToeicQuestionBackCard({
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
      visible: isUnder,
      child: Transform(
          transform: Matrix4.rotationY(isUnder ? 3.14159 : 0),
          alignment: Alignment.center,
          child: InkWell(
            onTap: () => tQTestcontroller.flipCard(),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(Responsive.height10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Chapter5Description(
                              description: question.description,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
