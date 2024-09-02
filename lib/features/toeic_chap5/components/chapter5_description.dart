import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';

class Chapter5Description extends StatelessWidget {
  const Chapter5Description({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    String description2 = description;
    description2 = description.replaceAll('【', '・');
    description2 = description2.replaceAll('】', '');
    return Html(
      data: description2,
      style: {
        "*": Style(
          fontFamily: AppFonts.japaneseFont,
          fontSize: FontSize(Responsive.width18),
        ),
        "h3": Style(
          padding: HtmlPaddings.symmetric(
              horizontal: Responsive.width10 / 2,
              vertical: Responsive.height10 / 2),
          margin: Margins.zero,
          fontSize: FontSize(Responsive.width24),
          color: Colors.white,
          backgroundColor: AppColors.mainBordColor,
        ),
        "h4": Style(
          // padding: HtmlPaddings.symmetric(
          //     horizontal: Responsive.width10 / 2,
          //     vertical: Responsive.height10 / 2),
          margin: Margins.symmetric(vertical: Responsive.height10 / 2),
          fontSize: FontSize(Responsive.width18),

          // backgroundColor: Colors.grey,
        )
      },
    );
    // return HtmlWidget(
    //   description2,
    //   textStyle: TextStyle(
    //     fontFamily: AppFonts.japaneseFont,
    //     fontSize: Responsive.height17,
    //     color: Colors.black,
    //     fontWeight: FontWeight.w600,
    //   ),
    //   customStylesBuilder: (element) {
    //     print('element : ${element}');

    //     if (element.toString().contains(
    //         '')) {
    //       print('ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴ');

    //       return {'color': 'white'};
    //     } else if (element.classes.contains('bold')) {
    //       return {
    //         'color': 'red',
    //         'font-weight': 'bold',
    //       };
    //     }
    //     if (element.toString().contains('div')) {
    //       return {
    //         'padding': '0px',
    //         'font-size': '18px',
    //       };
    //     }
    //     if (element.toString().contains('p')) {
    //       return {
    //         'padding': '0px',
    //         'font-size': '16px',
    //       };
    //     }
    //     return null;
    //   },
    // );
  }
}
