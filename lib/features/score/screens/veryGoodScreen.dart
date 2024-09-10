import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';

class VeryGoodScreen extends StatelessWidget {
  const VeryGoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Center(child: CelebrationScreen()),
      ),
      bottomNavigationBar: const GlobalBannerAdmob(),
    );
  }
}

class CelebrationScreen extends StatefulWidget {
  const CelebrationScreen({super.key});

  @override
  State<CelebrationScreen> createState() => _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive, // 모든 방향으로 폭발
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow
              ],
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'おめでとうございます！!\n',
                children: [
                  TextSpan(
                    text: '100点',
                    style: TextStyle(
                      fontSize: Responsive.height30 * 1.5,
                      color: Colors.redAccent,
                    ),
                  ),
                  const TextSpan(
                    text: 'です！！\n\n',
                  ),
                  TextSpan(
                    text: 'TOEICの満点まで、一歩前進しました！\nもっと頑張りましょう！',
                    style: TextStyle(
                      fontSize: Responsive.height18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
                style: TextStyle(
                  fontSize: Responsive.height30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: AppFonts.japaneseFont,
                ),
              ),
            ),
            SizedBox(height: Responsive.height30),
            const JonggackAvator(),
          ],
        ),
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirectionality: BlastDirectionality.explosive, // 모든 방향으로 폭발
          shouldLoop: false,
          colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow],
        ),
      ],
    );
  }
}
