import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/home_screen_body.dart';
import 'package:jonggack_toeic_japanese/features/search/widgets/search_widget.dart';
import 'package:jonggack_toeic_japanese/common/controller/tts_controller.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/screens/book_step_screen.dart';
import 'package:jonggack_toeic_japanese/features/home/services/home_controller.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';

import '../../../common/admob/banner_ad/global_banner_admob.dart';

// ignore: constant_identifier_names
enum CategoryEnum { Japaneses, Kangis, Grammars }

extension CategoryEnumExtension on CategoryEnum {
  String get id {
    switch (this) {
      case CategoryEnum.Japaneses:
        return '単語';
      case CategoryEnum.Kangis:
        return '慣用句';
      case CategoryEnum.Grammars:
        return '';
    }
  }
}

class JlptHomeScreen extends StatefulWidget {
  const JlptHomeScreen(
      {super.key,
      required this.level,
      required this.index,
      required this.title});
  final String level;
  final int index;
  final String title;
  @override
  State<JlptHomeScreen> createState() => _JlptHomeScreenState();
}

class _JlptHomeScreenState extends State<JlptHomeScreen> {
  late PageController pageController;
  HomeController homeController = Get.find<HomeController>();
  TtsController ttsController = Get.find<TtsController>();
  String title = '';
  int selectedCategoryIndex = 0;

  onPageChanged(int newPage) {
    selectedCategoryIndex = newPage;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    LocalReposotiry.putBasicOrJlptOrMyDetail(KindOfStudy.JLPT, widget.index);
    selectedCategoryIndex = 0;
    LocalReposotiry.getJlptOrKangiOrGrammar('${widget.index + 1}');
    pageController = PageController(initialPage: selectedCategoryIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Widget getBodys(CategoryEnum categoryEnum) {
    switch (categoryEnum) {
      case CategoryEnum.Japaneses:
        return BookStepScreen(
          level: widget.level,
          categoryEnum: CategoryEnum.Japaneses,
        );
      case CategoryEnum.Grammars:
        return BookStepScreen(
          level: widget.level,
          categoryEnum: CategoryEnum.Grammars,
        );
      case CategoryEnum.Kangis:
        return BookStepScreen(
          level: widget.level,
          categoryEnum: CategoryEnum.Kangis,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
          scrolledUnderElevation: 0.0,
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: appBarTextSize,
              // fontFamily: AppFonts.japaneseFont,
            ),
          ),
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
                if (widget.index != 3)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: Responsive.height10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        CategoryEnum.values.length - 1,
                        (index) => TextButton(
                          onPressed: () {
                            LocalReposotiry.putJlptOrKangiOrGrammar(
                                '${widget.index + 1}', index);
                            pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: selectedCategoryIndex == index
                                  ? Border(
                                      bottom: BorderSide(
                                        width: Responsive.width10 * 0.3,
                                        color: Colors.cyan.shade600,
                                      ),
                                    )
                                  : null,
                            ),
                            child: Text(
                              CategoryEnum.values[index].id,
                              style: index == selectedCategoryIndex
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
                        ),
                      ),
                    ),
                  ),
                Flexible(
                  flex: 6,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: CategoryEnum.values.length,
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, index) {
                      return getBodys(CategoryEnum.values[index]);
                    },
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}
