import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/common.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';

import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/model/example.dart';
import 'package:jonggack_toeic_japanese/common/controller/tts_controller.dart';
import 'package:jonggack_toeic_japanese/repository/kangis_step_repository.dart';

import '../../../config/theme.dart';

class GrammarExampleCard extends StatefulWidget {
  const GrammarExampleCard({
    super.key,
    required this.examples,
    required this.index,
  });
  final List<Example> examples;
  final int index;
  @override
  State<GrammarExampleCard> createState() => _GrammarExampleCardState();
}

class _GrammarExampleCardState extends State<GrammarExampleCard> {
  KangiStepRepositroy kangiStepRepositroy = KangiStepRepositroy();

  @override
  Widget build(BuildContext context) {
    String grammarWrod = '';
    if (widget.examples[widget.index].yomikata == '' ||
        widget.examples[widget.index].yomikata == null) {
      grammarWrod = widget.examples[widget.index].word;
    } else {
      grammarWrod = widget.examples[widget.index].yomikata!;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: Responsive.height16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        String temp = widget.examples[widget.index].word;
                        temp = temp.replaceAll('<span class="bold">', '');
                        temp = temp.replaceAll('</span>', '');
                        copyWord(temp);
                      },
                      child: Html(
                        data: '${widget.index + 1}. $grammarWrod',
                        style: {
                          "*": Style(
                            margin: Margins.zero,
                            fontFamily: AppFonts.japaneseFont,
                            fontWeight: FontWeight.w600,
                            fontSize: FontSize(Responsive.height17),
                          )
                        },
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Text(
                        widget.examples[widget.index].mean,
                        style: TextStyle(
                          // color: Colors.grey,
                          fontSize: Responsive.height16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GetBuilder<TtsController>(
            builder: (ttsController) {
              return IconButton(
                style: IconButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(20, 20),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  String grammar = widget.examples[widget.index].word;
                  grammar = grammar.replaceAll('<span class=\"bold\">', '');
                  grammar = grammar.replaceAll('</span>', '');
                  ttsController.speak(grammar);
                },
                icon: FaIcon(
                  ttsController.isPlaying
                      ? FontAwesomeIcons.volumeLow
                      : FontAwesomeIcons.volumeOff,
                  color: AppColors.mainBordColor,
                  size: Responsive.height10 * 2.6,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
