import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';

import '../../../config/colors.dart';

class UploadExcelInfomation extends StatelessWidget {
  const UploadExcelInfomation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          style: TextStyle(fontSize: Responsive.height16),
          TextSpan(
            text: '１. ',
            style: TextStyle(
              color: AppColors.scaffoldBackground,
              fontSize: Responsive.height14,
            ),
            children: const [
              TextSpan(text: '拡張子', style: TextStyle(color: Colors.red)),
              TextSpan(text: 'を'),
              TextSpan(text: '.xlsx', style: TextStyle(color: Colors.red)),
              TextSpan(text: 'に準備しておいてください。'),
            ],
          ),
        ),
        SizedBox(height: Responsive.height10 / 2),
        const ExcelInfoText(
          number: '２. ',
          text1: '一番目の行',
          text2: '英語',
        ),
        SizedBox(height: Responsive.height10 / 2),
        const ExcelInfoText(
          number: '3. ',
          text1: '二番目の行',
          text2: '意味',
        ),
        // SizedBox(height: Responsive.height10 / 2),
        // const ExcelInfoText(
        //   number: '4. ',
        //   text1: '세번째 열',
        //   text2: '뜻',
        // ),
        SizedBox(height: Responsive.height10 / 2),
        Text.rich(
          style: TextStyle(fontSize: Responsive.height16),
          TextSpan(
            text: '5. ',
            style: TextStyle(
              color: AppColors.scaffoldBackground,
              fontSize: Responsive.height14,
            ),
            children: const [
              TextSpan(text: '空く行', style: TextStyle(color: Colors.red)),
              TextSpan(text: 'が'),
              TextSpan(text: 'ないように', style: TextStyle(color: Colors.red)),
              TextSpan(text: '入力してください。'),
            ],
          ),
        )
      ],
    );
  }
}

class ExcelInfoText extends StatelessWidget {
  const ExcelInfoText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.number});

  final String number;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: number,
        style: TextStyle(
          color: AppColors.scaffoldBackground,
          fontSize: Responsive.height14,
        ),
        children: [
          TextSpan(text: text1, style: const TextStyle(color: Colors.red)),
          const TextSpan(text: 'に'),
          TextSpan(text: text2, style: const TextStyle(color: Colors.red)),
          const TextSpan(text: 'を入力してください。'),
        ],
      ),
    );
  }
}
