import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';

import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/kangi/controller/kangi_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/kangi_study/widgets/kangi_card.dart';

import '../../../../common/admob/banner_ad/global_banner_admob.dart';
import '../../../setting/services/setting_controller.dart';

final String KANGI_STUDY_PATH = '/kangi_study';
final String IS_TEST_AGAIN = 'isTestAgain';

// ignore: must_be_immutable
class KangiStudySceen extends StatefulWidget {
  final int currentIndex;
  const KangiStudySceen({super.key, required this.currentIndex});

  @override
  State<KangiStudySceen> createState() => _KangiStudySceenState();
}

class _KangiStudySceenState extends State<KangiStudySceen> {
  SettingController settingController = Get.find<SettingController>();
  final KangiStepController kangiStepController =
      Get.find<KangiStepController>();

  late PageController pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    kangiStepController.currentIndex = widget.currentIndex;
    currentIndex = widget.currentIndex;
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KangiStepController>(builder: (controller) {
      int wordsLen = controller.getKangiStep().kangis.length;
      return Scaffold(
        appBar: _appBar(controller, wordsLen),
        body: _body(controller, wordsLen),
        bottomNavigationBar: const GlobalBannerAdmob(),
      );
    });
  }

  PreferredSize _appBar(KangiStepController controller, int wordsLen) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(appBarHeight),
      child: AppBar(
        title: wordsLen != controller.currentIndex
            ? CustomAppBarTitle(
                curIndex: controller.currentIndex + 1,
                totalIndex: controller.getKangiStep().kangis.length,
              )
            : null,
      ),
    );
  }

  Widget _body(KangiStepController controller, int wordsLen) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: controller.onPageChanged,
      itemCount: wordsLen >= 4 ? wordsLen + 1 : wordsLen,
      itemBuilder: (context, index) {
        if (index == wordsLen) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: InkWell(
              onTap: () => controller.goToTest(isOffAndToName: true),
              child: Card(
                child: Center(
                  child: Text(
                    '퀴즈 풀러 가기!',
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
        return KangiCard(
            controller: controller,
            kangi: controller.getKangiStep().kangis[index]);
      },
    );
  }
}

// class KangiStudyButtons extends StatelessWidget {
//   const KangiStudyButtons({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double buttonWidth = size.width * 0.29;
//     double buttonHeight = 50;

//     return GetBuilder<KangiStudyController>(builder: (controller) {
//       return GetBuilder<TtsController>(builder: (tController) {
//         return Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ZoomOut(
//                   animate: controller.isShownUndoc,
//                   duration: const Duration(milliseconds: 300),
//                   child: KangiButton(
//                     text: '음독',
//                     width: buttonWidth,
//                     height: buttonHeight,
//                     onTap: tController.disalbe ? null : controller.showUndoc,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 KangiButton(
//                   text: '몰라요',
//                   width: buttonWidth,
//                   height: buttonHeight,
//                   onTap: tController.disalbe
//                       ? null
//                       : () => controller.nextWord(false),
//                 ),
//                 SizedBox(width: Dimentions.width10),
//                 ZoomOut(
//                   animate: controller.isShownKorea,
//                   duration: const Duration(milliseconds: 300),
//                   child: KangiButton(
//                     text: '한자',
//                     width: buttonWidth,
//                     height: buttonHeight,
//                     onTap: tController.disalbe ? null : controller.showYomikata,
//                   ),
//                 ),
//                 SizedBox(width: Dimentions.width10),
//                 KangiButton(
//                   width: buttonWidth,
//                   height: buttonHeight,
//                   text: '알아요',
//                   onTap: tController.disalbe
//                       ? null
//                       : () => controller.nextWord(true),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ZoomOut(
//                   animate: controller.isShownHundoc,
//                   child: KangiButton(
//                     text: '훈독',
//                     width: buttonWidth,
//                     height: buttonHeight,
//                     onTap: tController.disalbe ? null : controller.showHundoc,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       });
//     });
//   }
// }
