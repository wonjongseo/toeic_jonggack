import 'package:auto_size_text/auto_size_text.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';

class KangiText extends StatelessWidget {
  const KangiText({
    super.key,
    required this.japanese,
    required this.clickTwice,
    this.color = Colors.black,
    this.fontSize = 60,
  });

  final String japanese;
  final bool clickTwice;
  final double fontSize;

  final Color color;
  @override
  Widget build(BuildContext context) {
    // 동음 의이어가 있는가 없는가.
    bool isHomonym = japanese.contains('·');
    // 동음 이의어들

    List<String> homonymWords = japanese.split('·');

    return AutoSizeText(
      japanese,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize == 60 ? Responsive.height50 : Responsive.height30,
        color: AppColors.scaffoldBackground,
        fontFamily: AppFonts.japaneseFont,
      ),
      maxLines: 1,
    );
  }
}
