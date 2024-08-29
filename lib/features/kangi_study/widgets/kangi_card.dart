import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/widget/custom_appbar.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_and_kangi/kangi/controller/kangi_step_controller.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/widgets/related_word.dart';
import 'package:jonggack_toeic_japanese/model/word.dart';
import 'package:jonggack_toeic_japanese/repository/jlpt_step_repository.dart';
import 'package:kanji_drawing_animation/kanji_drawing_animation.dart';

import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/features/jlpt_study/widgets/word_card.dart';

import 'package:jonggack_toeic_japanese/model/kangi.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';

// ignore: must_be_immutable
class KangiCard extends StatefulWidget {
  KangiCard({
    Key? key,
    required this.kangi,
    this.controller,
  }) : super(key: key);
  final Kangi kangi;
  KangiStepController? controller;

  @override
  State<KangiCard> createState() => _KangiCardState();
}

class _KangiCardState extends State<KangiCard> {
  List<Word> relatedVocaFromJLPTWord = [];
  @override
  initState() {
    super.initState();
    aa();
  }

  void aa() async {
    for (int i = 0; i < widget.kangi.relatedVoca.length; i++) {
      Word? word =
          await JlptRepositry.searchWord(widget.kangi.relatedVoca[i].word);

      if (word == null) {
        relatedVocaFromJLPTWord.add(widget.kangi.relatedVoca[i]);
      } else {
        relatedVocaFromJLPTWord.add((word));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.height11,
            horizontal: Responsive.width14,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.kangi.japan,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.height60,
                      color: Colors.black,
                      fontFamily: AppFonts.japaneseFont,
                    ),
                  ),
                  if (widget.controller != null)
                    !widget.controller!.isSavedInLocal(widget.kangi)
                        ? IconButton(
                            onPressed: () {
                              widget.controller!.toggleSaveWord(widget.kangi);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.bookmark,
                              color: AppColors.mainBordColor,
                              size: Responsive.height10 * 2.2,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              widget.controller!.toggleSaveWord(widget.kangi);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.solidBookmark,
                              color: AppColors.mainBordColor,
                              size: Responsive.height10 * 2.2,
                            ),
                          )
                ],
              ),
              Text(
                widget.kangi.korea,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height25,
                ),
              ),
              SizedBox(height: Responsive.height15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '음독 :  ${widget.kangi.undoc}',
                          style: TextStyle(
                            fontSize: Responsive.height18,
                            fontWeight: FontWeight.w800,
                            fontFamily: AppFonts.japaneseFont,
                          ),
                        ),
                        Text(
                          '훈독 :  ${widget.kangi.hundoc}',
                          style: TextStyle(
                            fontSize: Responsive.height18,
                            fontWeight: FontWeight.w800,
                            fontFamily: AppFonts.japaneseFont,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(height: Responsive.height10),
              Text(
                '연관 단어',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height10 * 1.8,
                  color: AppColors.mainBordColor,
                ),
              ),
              SizedBox(height: Responsive.height10),
              Expanded(
                child: ListView.builder(
                  itemCount: relatedVocaFromJLPTWord.length,
                  itemBuilder: (context, index2) {
                    String mean = relatedVocaFromJLPTWord[index2].mean;
                    if (relatedVocaFromJLPTWord[index2]
                        .mean
                        .contains('\n2. ')) {
                      mean = relatedVocaFromJLPTWord[index2]
                              .mean
                              .split('\n2. ')[0] +
                          "...";
                    }
                    return Container(
                      decoration: BoxDecoration(border: Border.all(width: 0.5)),
                      padding: EdgeInsets.only(bottom: Responsive.height10),
                      child: ListTile(
                        minLeadingWidth: Responsive.width10 * 7,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        onTap: () async {
                          Get.to(
                            () => RelatedKangiWordScreen(
                                relatedVoca: relatedVocaFromJLPTWord,
                                index: index2),
                            preventDuplicates: false,
                          );
                          // }
                        },
                        leading: Text(
                          relatedVocaFromJLPTWord[index2].word,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Responsive.height20,
                            color: Colors.black,
                            fontFamily: AppFonts.japaneseFont,
                          ),
                        ),
                        title: Text(
                          relatedVocaFromJLPTWord[index2].yomikata,
                          style: TextStyle(
                            fontSize: Responsive.height15,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.japaneseFont,
                          ),
                        ),
                        subtitle: Text(
                          mean,
                          style: TextStyle(
                            fontSize: Responsive.width14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Responsive.height10 * 3),
              InkWell(
                onTap: () {
                  Get.bottomSheet(SizedBox(
                    width: double.infinity,
                    child: KanjiDrawingAnimation(widget.kangi.japan, speed: 60),
                  ));
                },
                child: Text(
                  '획순 보기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.height10 * 1.8,
                    color: AppColors.mainBordColor,
                  ),
                ),
              ),
              SizedBox(height: Responsive.height10 * 3),
            ],
          ),
        ),
      ),
    );
  }
}

class RelatedKangiWordScreen extends StatefulWidget {
  const RelatedKangiWordScreen(
      {super.key, required this.relatedVoca, required this.index});

  final List<Word> relatedVoca;
  final int index;
  @override
  State<RelatedKangiWordScreen> createState() => _RelatedKangiWordScreenState();
}

class _RelatedKangiWordScreenState extends State<RelatedKangiWordScreen> {
  late PageController pageController;
  int currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.index;
    pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(appBarHeight),
        child: AppBar(
          title: CustomAppBarTitle(
            curIndex: currentPageIndex + 1,
            totalIndex: widget.relatedVoca.length,
          ),
        ),
      ),
      body: PageView.builder(
        onPageChanged: onPageChanged,
        controller: pageController,
        itemCount: widget.relatedVoca.length,
        itemBuilder: (context, index) {
          return WordCard(word: widget.relatedVoca[index]);
        },
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }

  void onPageChanged(value) {
    currentPageIndex = value;
    setState(() {});
  }
}
