import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/how_to_user/widgets/engineer_said.dart';

class HowToUseScreen extends StatefulWidget {
  const HowToUseScreen({super.key});

  @override
  State<HowToUseScreen> createState() => _HowToUseScreenState();
}

class _HowToUseScreenState extends State<HowToUseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GlobalBannerAdmob(),
      appBar: AppBar(
          title: Text(
        'JLPT 종각 사용법',
        style: TextStyle(fontSize: Responsive.height10 * 2),
      )),
      body: Container(
        color: AppColors.whiteGrey,
        padding: EdgeInsets.symmetric(
          vertical: Responsive.height10,
          horizontal: Responsive.width10,
        ),
        margin: EdgeInsets.symmetric(
          vertical: Responsive.height10,
          horizontal: Responsive.width10,
        ),
        child: const Center(child: EngineerSaid()),
      ),
    );
  }
}
