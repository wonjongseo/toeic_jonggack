import 'package:flutter/material.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/home_screen_body.dart';

class StudyCategoryNavigator extends StatelessWidget {
  const StudyCategoryNavigator({
    super.key,
    required this.onTap,
    required this.currentPageIndex,
  });

  final Function(int) onTap;
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        KindOfStudy.values.length,
        (index) {
          return TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(
                Responsive.width10 * 10,
                Responsive.height10 * 3,
              ),
            ),
            onPressed: () => onTap(index),
            child: Container(
              decoration: BoxDecoration(
                border: index == currentPageIndex
                    ? Border(
                        bottom: BorderSide(
                          width: Responsive.width10 * 0.3,
                          color: Colors.cyan.shade600,
                        ),
                      )
                    : null,
              ),
              child: Text(
                KindOfStudy.values[index].value,
                style: index == currentPageIndex
                    ? TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan.shade600,
                        fontSize: Responsive.width20,
                      )
                    : TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: Responsive.width18,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
