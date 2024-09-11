import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/common.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/config/colors.dart';
import 'package:jonggack_toeic_japanese/config/size.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';
import '../../../common/admob/banner_ad/global_banner_admob.dart';
import '../services/setting_controller.dart';
import '../widgets/setting_button.dart';
import '../widgets/setting_switch.dart';

const SETTING_PATH = '/setting';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find<SettingController>();
    // ignore: deprecated_member_use
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(appBarHeight),
            child: AppBar(
              title: Text(
                '設定',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: appBarTextSize,
                ),
              ),
            )),
        body: _body(settingController.userController),
        bottomNavigationBar: const GlobalBannerAdmob(),
      ),
      onWillPop: () async {
        if (settingController.isInitial) {
          Get.dialog(const AlertDialog(
            content: Text(
              'アプリを終了して開き直してください。',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ));
        }
        return true;
      },
    );
  }

  Widget _body(UserController userController) {
    return Center(
      child: GetBuilder<SettingController>(
        builder: (settingController) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<UserController>(builder: (controller) {
                  return Column(
                    children: [
                      SoundSettingSlider(
                        activeColor: Colors.redAccent,
                        option: '音量',
                        value: userController.volumn,
                        label: '音量：${userController.volumn}',
                        onChangeEnd: (value) {
                          userController.updateSoundValues(
                              SOUND_OPTIONS.VOLUMN, value);
                        },
                        onChanged: (value) {
                          userController.onChangedSoundValues(
                              SOUND_OPTIONS.VOLUMN, value);
                        },
                      ),
                      SoundSettingSlider(
                        activeColor: Colors.blueAccent,
                        option: '音調',
                        value: userController.pitch,
                        label: '音調：${userController.pitch}',
                        onChangeEnd: (value) {
                          userController.updateSoundValues(
                              SOUND_OPTIONS.PITCH, value);
                        },
                        onChanged: (value) {
                          userController.onChangedSoundValues(
                              SOUND_OPTIONS.PITCH, value);
                        },
                      ),
                      SoundSettingSlider(
                        activeColor: Colors.deepPurpleAccent,
                        option: '速さ',
                        value: userController.rate,
                        label: '速さ：${userController.rate}',
                        onChangeEnd: (value) {
                          userController.updateSoundValues(
                              SOUND_OPTIONS.RATE, value);
                        },
                        onChanged: (value) {
                          userController.onChangedSoundValues(
                              SOUND_OPTIONS.RATE, value);
                        },
                      ),
                    ],
                  );
                }),
                SettingButton(
                  text: '自分の単語帳を初期化',
                  onPressed: () async {
                    if (await settingController.initMyWords()) {
                      settingController.successDeleteAndQuitApp();
                    }
                  },
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.mail),
                        TextButton(
                          onPressed: () async {
                            // Get.back();

                            String body =
                                """
    
    ⭐️ 【希望の機能を提供する】
    
    
    ==========================
    
    ⭐️ [バグ・エラーの提供]
    
    🔸 バグ・エラーの提供が発生したページ：　  
       例) Chapter５問題長のページ
    
    🔸 バグ・エラーの内容
       例) 次の問題に移動できない
    
    
    ==========================
    
    ▪️イメージを添付して頂ければ、バグ・エラーを修正するのに大きな助けになります！！▪️
                """;

                            final Email email = Email(
                              body: body,
                              subject: '【一番TOEIC】希望の機能を提供',
                              recipients: ['visionwill3322@gmail.com'],
                              isHTML: false,
                            );
                            try {
                              await FlutterEmailSender.send(email);
                            } catch (e) {
                              bool result =
                                  await CommonDialog.errorNoEnrolledEmail();
                              if (result) {
                                copyWord('visionwill3322@gmail.com');
                              }
                            }
                          },
                          child: Text(
                            '希望の機能又はバグ・エラーの提供',
                            style: TextStyle(
                              fontFamily: AppFonts.japaneseFont,
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.width14,
                              color: AppColors.scaffoldBackground,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AutoSizeText(
                      '提供は開発者に大きな助けになります！',
                      style: TextStyle(
                        fontFamily: AppFonts.japaneseFont,
                        fontSize: Responsive.width14,
                        color: AppColors.scaffoldBackground,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                const Spacer(),
              ]
              // ],
              );
        },
      ),
    );
  }
}

class SoundSettingSlider extends StatelessWidget {
  const SoundSettingSlider({
    super.key,
    required this.value,
    required this.option,
    required this.label,
    required this.activeColor,
    required this.onChangeEnd,
    required this.onChanged,
  });

  final double value;
  final String option;
  final String label;
  final Color activeColor;
  final Function(double) onChangeEnd;
  final Function(double) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(option),
          Expanded(
            child: Slider(
              value: value,
              onChangeEnd: (v) {
                onChangeEnd(v);
              },
              onChanged: onChanged,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              activeColor: activeColor,
              label: label,
            ),
          )
        ],
      ),
    );
  }
}
