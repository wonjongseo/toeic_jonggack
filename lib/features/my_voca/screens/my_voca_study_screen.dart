import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/controller/tts_controller.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/widgets/word_card.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_test/screens/jlpt_test_screen.dart';
import 'package:jonggack_toeic_japanese/features/my_voca/services/my_voca_controller.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';

class MyVocaStduySCreen extends StatefulWidget {
  const MyVocaStduySCreen({super.key, required this.index});
  final int index;
  @override
  State<MyVocaStduySCreen> createState() => _MyVocaStduySCreenState();
}

class _MyVocaStduySCreenState extends State<MyVocaStduySCreen> {
  late PageController pageController;

  MyVocaController controller = Get.find<MyVocaController>();
  TtsController ttsController = Get.find<TtsController>();
  @override
  void initState() {
    controller.currentIndex = widget.index;
    pageController = PageController(initialPage: controller.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyVocaController>(builder: (controller) {
      int wordsLen = controller.selectedWord.length;

      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(appBarHeight),
          child: AppBar(
            title: wordsLen == controller.currentIndex
                ? null
                : CustomAppBarTitle(
                    curIndex: controller.currentIndex + 1,
                    totalIndex: controller.selectedWord.length,
                  ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) async {
                await ttsController.stop();
                controller.onPageChanged(value);
              },
              itemCount: wordsLen >= 4 ? wordsLen + 1 : wordsLen,
              itemBuilder: (context, index) {
                if (wordsLen == index && wordsLen >= 4) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          JLPT_TEST_PATH,
                          arguments: {MY_VOCA_TEST: controller.selectedWord},
                        );
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            'テストに挑戦！',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan.shade600,
                                fontSize: Responsive.height10 * 2.4),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return WordCard(
                  word: Word.myWordToWord(controller.selectedWord[index]),
                  fnMyWordDelete: () {
                    controller.deleteWord(
                      controller.selectedWord[controller.currentIndex],
                      isYokumatiageruWord: !controller.isManualSavedWordPage,
                    );
                    int curSelectWordLen = controller.selectedWord.length;
                    if (curSelectWordLen == 0) {
                      return Get.back();
                    } else {
                      Get.off(
                        () => MyVocaStduySCreen(
                          index: controller.currentIndex,
                        ),
                        preventDuplicates: false,
                      );
                    }
                    // else {
                    //   controller.currentIndex = controller.currentIndex - 1;
                    //   Get.off(
                    //     () => MyVocaStduySCreen(
                    //       index: controller.currentIndex,
                    //     ),
                    //     preventDuplicates: false,
                    //   );
                    // }
                    // int nextIndex = controller.selectedWord.length >= 4
                    //     ? controller.currentIndex
                    //     : controller.currentIndex - 1;
                    // Get.off(
                    //   () => MyVocaStduySCreen(
                    //     index: nextIndex,
                    //   ),
                    //   preventDuplicates: false,
                    // );
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: const GlobalBannerAdmob(),
      );
    });
  }
}
