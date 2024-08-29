import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/grammar_step/services/grammar_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/jlpt/controller/jlpt_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/kangi/controller/kangi_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/screens/calendar_step_sceen.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_home/screens/jlpt_home_screen.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';

final String BOOK_STEP_PATH = '/book-step';

// ignore: must_be_immutable
class BookStepScreen extends StatefulWidget {
  late JlptStepController jlptWordController;
  late KangiStepController kangiController;
  late GrammarController grammarController;
  final String level;
  final CategoryEnum categoryEnum;

  BookStepScreen({super.key, required this.level, required this.categoryEnum}) {
    if (categoryEnum == CategoryEnum.Japaneses) {
      print('categoryEnum : ${categoryEnum}');

      jlptWordController = Get.put(
        JlptStepController(level: oneTo3000List[int.parse(level) - 1]),
      );
    } else if (categoryEnum == CategoryEnum.Kangis) {
      kangiController = Get.put(KangiStepController(level: level));
    } else {
      grammarController = Get.put(GrammarController(level: level));
    }
  }

  @override
  State<BookStepScreen> createState() => _BookStepScreenState();
}

class _BookStepScreenState extends State<BookStepScreen> {
  int isProgrssing = 0;
  UserController userController = Get.find<UserController>();

  void goTo(int index, String chapter) {
    if (widget.categoryEnum == CategoryEnum.Japaneses) {
      Get.toNamed(JLPT_CALENDAR_STEP_PATH,
          arguments: {'chapter': chapter, 'categoryEnum': widget.categoryEnum});
    } else if (widget.categoryEnum == CategoryEnum.Kangis) {
      Get.toNamed(JLPT_CALENDAR_STEP_PATH,
          arguments: {'chapter': chapter, 'categoryEnum': widget.categoryEnum});
    } else {
      widget.grammarController.setStep(index);
      Get.toNamed(JLPT_CALENDAR_STEP_PATH,
          arguments: {'chapter': chapter, 'categoryEnum': widget.categoryEnum});
    }
  }

  @override
  void initState() {
    super.initState();
    isProgrssing = LocalReposotiry.getCurrentProgressing(
        '${widget.categoryEnum.name}-${widget.level}');
  }

  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    int len = 0;
    switch (widget.categoryEnum) {
      case CategoryEnum.Japaneses:
        len = widget.jlptWordController.headTitleCount;
        break;
      case CategoryEnum.Kangis:
        len = widget.kangiController.headTitleCount;
        break;
      case CategoryEnum.Grammars:
        len = widget.grammarController.grammers.length;
        break;
    }

    return GetBuilder<UserController>(builder: (controller) {
      return CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          enableInfiniteScroll: false,
          disableCenter: true,
          initialPage: isProgrssing,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            isProgrssing = index;
          },
          scrollDirection: Axis.horizontal,
        ),
        items: List.generate(
          len,
          (index) {
            bool isAllAccessable = !(widget.level == '1' && index > 2) ||
                controller.user.isPremieum ||
                controller.user.isTrik;
            return InkWell(
              onLongPress: () {
                if (isAllAccessable) {
                  return;
                }
                userController.changeUserAuth();
              },
              onTap: () {
                if (!isAllAccessable) {
                  CommonDialog.appealDownLoadThePaidVersion();

                  return;
                }
                if (isProgrssing == index) {
                  LocalReposotiry.putCurrentProgressing(
                      '${widget.categoryEnum.name}-${widget.level}',
                      isProgrssing);
                  // goTo(index, '챕터${index + 1}');
                  goTo(index, index.toString());
                } else if (isProgrssing < index) {
                  isProgrssing++;
                  carouselController.animateToPage(isProgrssing);
                } else {
                  isProgrssing--;
                  carouselController.animateToPage(isProgrssing);
                }
                setState(() {});
              },
              child: Card(
                color: !isAllAccessable ? Colors.grey.shade400 : Colors.white,
                child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: '${widget.categoryEnum.id}\n',
                                children: [
                                  TextSpan(
                                    text: 'Chapter ${(index + 1)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Responsive.height10 * 3,
                                    ),
                                  )
                                ],
                                style: TextStyle(
                                  fontFamily: AppFonts.gMaretFont,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Responsive.height10 * 2.3,
                                  color: isAllAccessable
                                      ? AppColors.mainBordColor
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          if (!isAllAccessable)
                            const Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.lock,
                                size: 100,
                              ),
                            ),
                          if (isProgrssing == index)
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Card(
                                shape: const CircleBorder(),
                                child: Container(
                                  height: Responsive.height10 * 2,
                                  width: Responsive.height10 * 2,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGreen,
                                    borderRadius: BorderRadius.circular(
                                      Responsive.height10 * 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )),
              ),
            );
          },
        ),
      );
    });
  }
}
