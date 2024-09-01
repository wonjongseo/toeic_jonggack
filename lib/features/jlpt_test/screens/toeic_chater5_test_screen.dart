import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/toeic_chater5_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_test/controller/jlpt_test_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_test/controller/toeic_chater5_test_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_test/widgets/jlpt_test_body.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/widgets/progress_bar.dart';

const JLPT_TEST_PATH = '/test';
const JLPT_TEST = 'jlpt';
const CONTINUTE_JLPT_TEST = 'continue_jlpt_test';
const MY_VOCA_TEST = 'my_vcoa_test';
const MY_VOCA_TEST_KNOWN = 'known';
const MY_VOCA_TEST_UNKNWON = 'un_known';

class ToeicChater5TestScreen extends StatelessWidget {
  const ToeicChater5TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToeicChater5TestController jlptTestController =
        Get.put(ToeicChater5TestController());
    jlptTestController.init(Get.arguments);
    return Scaffold(
      appBar: _appBar(context, jlptTestController),
      body: const JlptTestBody(),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }

  AppBar _appBar(
      BuildContext context, ToeicChater5TestController questionController) {
    return AppBar(
      title: const ProgressBar(isKangi: false),
      actions: [
        GetBuilder<JlptTestController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: questionController.skipQuestion,
              child: Text(
                controller.nextOrSkipText,
                style: TextStyle(
                  color: controller.color,
                  fontSize: Responsive.height20,
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
