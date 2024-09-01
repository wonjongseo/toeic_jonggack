import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
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
    print('toeciGrammarTexts.length : ${toeciGrammarTexts.length}');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
            title: CustomAppBarTitle(
          curIndex: currentPageIndex + 1,
          totalIndex: toeciGrammarTexts.length,
        )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(flex: 1),
              const NewSearchWidget(),
              const Spacer(flex: 1),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  disableCenter: true,
                  aspectRatio: 0.8,
                  // viewportFraction: userController.user.isPad ? 0.55 : 0.75,
                  enableInfiniteScroll: false,
                  initialPage: currentPageIndex,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    onPageChanged(index);
                  },
                  scrollDirection: Axis.horizontal,
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
                      child: Center(
                          child: Text(
                        toeciGrammarTexts[index]['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Responsive.height20,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3),
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
      appBar: AppBar(),
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
