import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_test/controller/jlpt_test_controller.dart';
import 'package:jonggack_toeic_japanese/model/Question.dart';

import 'jlpt_test_option.dart';
import 'jlpt_test_text_form_field.dart';

class JlptTestCard extends StatelessWidget {
  JlptTestCard({super.key, required this.question});

  final Question question;
  final JlptTestController controller = Get.find<JlptTestController>();

  @override
  Widget build(BuildContext context) {
    String qustionWord = question.question.word;

    if (qustionWord.contains('·')) {
      qustionWord = qustionWord.split('·')[0];
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Responsive.width20),
      padding: EdgeInsets.all(Responsive.width20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Responsive.width24),
          topRight: Radius.circular(Responsive.width24),
        ),
      ),
      child: Column(
        children: [
          Text(
            qustionWord,
            style: TextStyle(
              fontSize: Responsive.height10 * 2.2,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.japaneseFont,
            ),
          ),
          SizedBox(height: Responsive.height40),
          if (controller.settingController.isTestKeyBoard)
            const JlptTestTextFormField(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: List.generate(
                question.options.length,
                (index) => JlptTestOption(
                  test: question.options[index],
                  index: index,
                  press: () {
                    controller.checkAns(question, index);
                  },
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
