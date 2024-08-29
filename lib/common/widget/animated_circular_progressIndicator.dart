import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';

class AnimatedLeanerProgressIndicator extends StatelessWidget {
  const AnimatedLeanerProgressIndicator(
      {super.key, this.currentProgressCount, required this.totalProgressCount});

  final int? currentProgressCount;
  final int? totalProgressCount;

  @override
  Widget build(BuildContext context) {
    double percentage;
    if (currentProgressCount == null) {
      percentage = 0;
    } else {
      percentage = currentProgressCount! / totalProgressCount!;
    }

    return SizedBox(
      height: Responsive.width10 * 1.7,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: const Duration(milliseconds: 1500),
        builder: (context, double value, child) => Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            LinearProgressIndicator(
              value: value,
              color: AppColors.primaryColor,
              backgroundColor: Colors.grey.shade300,
            ),
            Center(
              child: Text(
                "${(value * 100).toInt()}%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Responsive.width10 * 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
