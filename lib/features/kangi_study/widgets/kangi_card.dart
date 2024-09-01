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
  double fontSize = Responsive.width15 * 3;
  @override
  void initState() {
    if (widget.kangi.word.length > 15) {
      fontSize = Responsive.width15 * 2.5;
    } else if (widget.kangi.word.length > 20) {
      fontSize = Responsive.width15 * 2;
    } else if (widget.kangi.word.length > 25) {
      fontSize = Responsive.width15 * 1.5;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.width16),
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
                  Flexible(
                    child: Text(
                      widget.kangi.word,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                        color: Colors.black,
                        fontFamily: AppFonts.japaneseFont,
                      ),
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
              SizedBox(height: Responsive.height15),
              const Divider(),
              SizedBox(height: Responsive.height10),
              Text(
                widget.kangi.mean,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive.height25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
