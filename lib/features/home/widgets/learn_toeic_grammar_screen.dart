import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/data/grammar_text_datas.dart';
import 'package:jonggack_toeic_japanese/features/home/screens/home_screen.dart';
import 'package:jonggack_toeic_japanese/features/search/widgets/search_widget.dart';

class LearnToeicGrammarScreen extends StatefulWidget {
  const LearnToeicGrammarScreen({super.key});

  @override
  State<LearnToeicGrammarScreen> createState() =>
      _LearnToeicGrammarScreenState();
}

class _LearnToeicGrammarScreenState extends State<LearnToeicGrammarScreen> {
  int currentPageIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  void onPageChanged(int index) {
    currentPageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
            title: Text(
          '文法学習',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: appBarTextSize,
          ),
        )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(flex: 1),
              const NewSearchWidget(),
              const Spacer(flex: 2),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  // scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  initialPage: currentPageIndex,
                  onPageChanged: (index, reason) {
                    onPageChanged(index);
                  },
                ),
                items: List.generate(
                  toeciGrammarTexts.length,
                  (index) => InkWell(
                    onTap: () {
                      Get.to(
                        () => LearnToeicGrammarDetailScreen(
                          selectedIndex: index,
                          toeicGrammarTexts: toeciGrammarTexts,
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive.width10),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '文法${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Responsive.width24,
                                color: AppColors.mainBordColor,
                              ),
                            ),
                            SizedBox(
                              height: Responsive.height10,
                            ),
                            Text(
                              '${toeciGrammarTexts[index]['title']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Responsive.width20,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}

class LearnToeicGrammarDetailScreen extends StatefulWidget {
  const LearnToeicGrammarDetailScreen({
    super.key,
    required this.toeicGrammarTexts,
    required this.selectedIndex,
  });
  final List<Map<String, dynamic>> toeicGrammarTexts;
  final int selectedIndex;

  @override
  State<LearnToeicGrammarDetailScreen> createState() =>
      _LearnToeicGrammarDetailScreenState();
}

class _LearnToeicGrammarDetailScreenState
    extends State<LearnToeicGrammarDetailScreen> {
  late PageController pageController;
  int currentPageIndex = 0;
  initState() {
    currentPageIndex = widget.selectedIndex;
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
            title: Text(
          '文法${currentPageIndex + 1}',
          style: TextStyle(
            fontSize: Responsive.height22,
            color: AppColors.mainBordColor,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: SafeArea(
        child: Center(
            child: PageView.builder(
          itemCount: widget.toeicGrammarTexts.length,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index) {
            return ToeicGrammarText(
              title: widget.toeicGrammarTexts[index]['title'],
              cosi: widget.toeicGrammarTexts[index]['cosi'],
              accentContent: widget.toeicGrammarTexts[index]['accentContent'],
              content: widget.toeicGrammarTexts[index]['content'],
            );
          },
        )),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }

  void onPageChanged(value) {
    currentPageIndex = value;
    setState(() {});
  }
}
