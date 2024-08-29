import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';

class StepSelectorButton extends StatelessWidget {
  const StepSelectorButton({
    super.key,
    required this.isEnabled,
    required this.isFinished,
    required this.isCurrent,
  });

  final bool isCurrent;
  final bool isEnabled;
  final bool isFinished;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isCurrent
          ? AppColors.mainColor
          : isEnabled
              ? Colors.cyan.shade200
              : Colors.grey.shade100,
      elevation: isCurrent ? 3 : 0,
      child: Container(
        width: Responsive.height10 * 8.5, //
        padding: EdgeInsets.all(Responsive.height8),
        child: Column(
          children: [
            if (isCurrent) ...[
              Icon(
                Icons.star,
                color: AppColors.primaryColor,
                size: Responsive.height10 * 1.6,
              )
            ] else if (isFinished || isEnabled) ...[
              FaIcon(
                FontAwesomeIcons.lockOpen,
                size: Responsive.height10 * 1.6,
              ),
            ] else ...[
              FaIcon(
                FontAwesomeIcons.lock,
                color: Colors.grey.shade500,
                size: Responsive.height10 * 1.6,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
