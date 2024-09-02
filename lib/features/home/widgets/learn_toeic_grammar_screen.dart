import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: AppBar(title: Text('文法')),
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
                          toeicGrammarText: toeciGrammarTexts[index],
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
    );
  }
}

class LearnToeicGrammarDetailScreen extends StatelessWidget {
  const LearnToeicGrammarDetailScreen({
    super.key,
    required this.toeicGrammarText,
  });
  final Map<String, dynamic> toeicGrammarText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(title: const Text('')),
      ),
      body: SafeArea(
        child: Center(
          child: ToeicGrammarText(
            title: toeicGrammarText['title'],
            cosi: toeicGrammarText['cosi'],
            accentContent: toeicGrammarText['accentContent'],
            content: toeicGrammarText['content'],
          ),
        ),
      ),
    );
  }
}
