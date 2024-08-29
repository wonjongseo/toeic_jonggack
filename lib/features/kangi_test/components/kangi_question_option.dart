import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/kangi_test/controller/kangi_test_controller.dart';
import 'package:jonggack_toeic_japanese/model/Question.dart';

class KangiQuestionOption extends StatelessWidget {
  const KangiQuestionOption(
      {Key? key,
      required this.question,
      required this.index,
      required this.press,
      required this.isAnswered,
      required this.color,
      required this.text})
      : super(key: key);

  // final Word test;
  final bool isAnswered;
  final int index;
  final Question question;
  final VoidCallback press;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    List<String> multMean = text.split(',');
    Size size = MediaQuery.of(context).size;

    if (multMean.length > 3) {
      multMean = multMean.sublist(0, 3);
    }
    return GetBuilder<KangiTestController>(
      init: KangiTestController(),
      builder: (qnController) {
        Container optionCard(
            Color color, IconData Function() getTheRightIcon, Size size) {
          return Container(
            margin: EdgeInsets.only(top: Responsive.height10 * 2),
            padding: EdgeInsets.all(Responsive.height16 / 2),
            height: size.height * 0.1,
            decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                if (multMean.length == 1)
                  Flexible(
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: color,
                          fontSize: Responsive.height14,
                          fontFamily: AppFonts.japaneseFont,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        multMean.length,
                        (index) => Text(
                          '${index + 1} ${multMean[index].trim()}',
                          style: TextStyle(
                            color: color,
                            fontSize: Responsive.height14,
                            fontFamily: AppFonts.japaneseFont,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }

        IconData getTheRightIcon() {
          return color == const Color(0xFFE92E30) ? Icons.close : Icons.done;
        }

        return qnController.isWrong
            ? optionCard(color, getTheRightIcon, size)
            : InkWell(
                onTap: press,
                child: optionCard(color, getTheRightIcon, size),
              );
      },
    );
  }
}
