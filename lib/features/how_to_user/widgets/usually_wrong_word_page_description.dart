import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';

class UsuallyWrongWordPageDescription extends StatelessWidget {
  const UsuallyWrongWordPageDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Responsive.height10),
          const Text(
            '자주 틀리는 문제 페이지',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.scaffoldBackground),
          ),
          SizedBox(height: Responsive.height20),
          const Text.rich(
            TextSpan(
              style: TextStyle(
                  height: 1.6,
                  wordSpacing: 1.2,
                  color: AppColors.scaffoldBackground),
              children: [
                TextSpan(text: '학습 페이지에서 '),
                TextSpan(
                  text: ' 파일 모양의 아이콘',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '을 클릭하면 자주 틀리는 문제 페이지에 '),
                TextSpan(
                  text: '저장',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '됩니다.\n\n'),
                TextSpan(text: ' 전날이나 이번주의 모르는 단어들을 '),
                TextSpan(
                  text: '한 번 더 [시험]',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: '을 통해 '),
                TextSpan(text: '학습합니다.\n\n'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
