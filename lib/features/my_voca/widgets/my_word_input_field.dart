import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/controller/ad_controller.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/features/my_voca/services/my_voca_controller.dart';
import 'package:jonggack_toeic_japanese/features/my_voca/widgets/upload_excel_infomation.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';

class MyWordInputField extends StatefulWidget {
  const MyWordInputField({super.key});

  @override
  State<MyWordInputField> createState() => _MyWordInputFieldState();
}

class _MyWordInputFieldState extends State<MyWordInputField> {
  bool isManual = true;
  AdController adController = Get.find<AdController>();
  MyVocaController controller = Get.find<MyVocaController>();
  UserController userController = Get.find<UserController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  isManual = true;
                  setState(() {});
                },
                child: DDDD(text: '直接に入力', isActive: isManual),
              ),
              InkWell(
                onTap: () {
                  isManual = false;
                  setState(() {});
                },
                child: DDDD(text: 'Excelのデータを保存', isActive: !isManual),
              ),
            ],
          ),
          SizedBox(height: Responsive.height15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: isManual
                ? Column(
                    children: [
                      Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              style: const TextStyle(
                                  color: AppColors.scaffoldBackground),
                              autofocus: true,
                              focusNode: controller.wordFocusNode,
                              onFieldSubmitted: (value) =>
                                  controller.manualSaveMyWord(),
                              controller: controller.wordController,
                              decoration: InputDecoration(
                                label: Text(
                                  '英語',
                                  style: TextStyle(
                                    fontSize: Responsive.height10 * 1.4,
                                    color: AppColors.scaffoldBackground,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppColors.scaffoldBackground),
                                focusNode: controller.yomikataFocusNode,
                                onFieldSubmitted: (value) =>
                                    controller.manualSaveMyWord(),
                                controller: controller.yomikataController,
                                decoration: InputDecoration(
                                  label: Text(
                                    '意味',
                                    style: TextStyle(
                                      fontSize: Responsive.height10 * 1.4,
                                      color: AppColors.scaffoldBackground,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Responsive.height10),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(Responsive.height10),
                        child: OutlinedButton(
                          onPressed: () {
                            controller.manualSaveMyWord();
                          },
                          child: Text(
                            '保存する',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.height10 * 1.6,
                              color: AppColors.mainBordColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EXCELデータのフォーマット',
                            style: TextStyle(
                              color: AppColors.scaffoldBackground,
                              fontSize: Responsive.height10 * 1.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Responsive.height16 / 2),
                            child: const UploadExcelInfomation(),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(Responsive.height10),
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () async {
                            int savedWordNumber =
                                await controller.postExcelData();
                            if (savedWordNumber != 0) {
                              Get.back();
                              Get.back();
                              Get.snackbar(
                                '成功',
                                '$savedWordNumber個の単語が保存されました。 （$savedWordNumberの単語は既に保存されております。）',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.white.withOpacity(0.5),
                                duration: const Duration(seconds: 4),
                                animationDuration: const Duration(seconds: 4),
                              );
                              userController.updateMyWordSavedCount(
                                true,
                                isYokumatiageruWord: false,
                                count: savedWordNumber,
                              );
                              return;
                            }
                          },
                          child: Text(
                            '保存',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainBordColor,
                              fontSize: Responsive.height10 * 1.6,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class DDDD extends StatelessWidget {
  const DDDD({
    super.key,
    required this.isActive,
    required this.text,
  });

  final bool isActive;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: AppColors.mainBordColor),
              ),
            )
          : null,
      child: Text(
        text,
        style: isActive
            ? TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.height16,
                color: AppColors.mainBordColor,
              )
            : TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Responsive.height14,
              ),
      ),
    );
  }
}
