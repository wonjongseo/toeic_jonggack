import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:jonggack_toeic_japanese/common/admob/banner_ad/global_banner_admob.dart';
import 'package:jonggack_toeic_japanese/common/commonDialog.dart';
import 'package:jonggack_toeic_japanese/common/controller/tts_controller.dart';
import 'package:jonggack_toeic_japanese/common/widget/dimentions.dart';
import 'package:jonggack_toeic_japanese/features/home/services/home_controller.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/home_screen_body.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/study_category_navigator.dart';
import 'package:jonggack_toeic_japanese/features/home/widgets/welcome_widget.dart';
import 'package:jonggack_toeic_japanese/features/search/widgets/search_widget.dart';
import 'package:jonggack_toeic_japanese/features/setting/services/setting_controller.dart';
import 'package:jonggack_toeic_japanese/notification/notification.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:jonggack_toeic_japanese/appReviewRequest.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';

import '../../../config/colors.dart';
import '../../../config/theme.dart';
import '../../how_to_user/screen/how_to_use_screen.dart';
import '../../setting/screens/setting_screen.dart';

const String HOME_PATH = '/home';

StreamController<String> streamController = StreamController.broadcast();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  KindOfStudy kindOfStudy = KindOfStudy.JLPT;
  late PageController pageController;
  int selectedCategoryIndex = 0;
  UserController userController = Get.find<UserController>();

  Future setting() async {
    await initNotification();
    await settingFunctions();

    await setAppReviewRequest();
  }

  Future<void> setAppReviewRequest() async {
    AppReviewRequest.checkReviewRequest();
  }

  initNotification() async {
    Future.delayed(const Duration(seconds: 3),
        await FlutterLocalNotification.requestNotificationPermission());
    await FlutterLocalNotification.showNotification();
  }

  SettingController settingController = Get.find<SettingController>();

  Future settingFunctions() async {
    bool isSeen = LocalReposotiry.isSeenHomeTutorial();

    if (!isSeen) {
      bool isKeyBoardActive =
          await CommonDialog.askSetSubjectQuestionOfJlptTestDialog();

      if (isKeyBoardActive) {
        if (!settingController.isTestKeyBoard) {
          settingController.flipTestKeyBoard();
        }
      } else {
        if (settingController.isTestKeyBoard) {
          settingController.flipTestKeyBoard();
        }
      }

      Get.closeAllSnackbars();
      Get.snackbar(
        '초기 설정이 완료 되었습니다.',
        '해당 설정들은 설정 페이지에서 재설정 할 수 있습니다.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.whiteGrey.withOpacity(0.5),
        duration: const Duration(seconds: 4),
        animationDuration: const Duration(seconds: 2),
      );
    }
    // TODO 살리기
    bool isNeedUpdateAllData = LocalReposotiry.getIsNeedUpdateAllData();

    // await CommonDialog.askToDeleteAllDataForUpdateDatas();
    if (isNeedUpdateAllData) {
      bool a = await CommonDialog.askToDeleteAllDataForUpdateDatas();
      if (a) {
        // LocalReposotiry.putAllDataUpdate(true);
        settingController.allDataDelete();
      } else {
        bool secondQuestion = await CommonDialog.askToDeleteAllDataOneMore();

        if (secondQuestion) {
          settingController.allDataDelete();
        } else {
          // LocalReposotiry.putAllDataUpdate(false);
        }
      }

      LocalReposotiry.putIsNeedUpdateAllData(false);
    }
  }

  @override
  void initState() {
    Get.put(TtsController());
    super.initState();
    FlutterLocalNotification.init();
    // initNotification();
    setting();
    selectedCategoryIndex = LocalReposotiry.getBasicOrJlptOrMy();
    pageController = PageController(initialPage: selectedCategoryIndex);
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return StreamBuilder<String>(
      stream: streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == 'HELLOWOLRD') {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                Get.to(() => const NotificaionScreen());
              },
            );
          }
        }

        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: homeController.scaffoldKey,
          endDrawer: _endDrawer(),
          body: _body(context, homeController),
          bottomNavigationBar: const GlobalBannerAdmob(),
        );
      },
    );
  }

  Drawer _endDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.message),
              title: TextButton(
                onPressed: () {
                  Get.back();
                  Get.to(() => const HowToUseScreen());
                },
                child: Text(
                  '앱 설명 보기',
                  style: TextStyle(
                    fontFamily: AppFonts.nanumGothic,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.width14,
                    color: AppColors.scaffoldBackground,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: TextButton(
                onPressed: () {
                  Get.back();
                  Get.toNamed(SETTING_PATH, arguments: {
                    'isSettingPage': true,
                  });
                },
                child: Text(
                  '설정 페이지',
                  style: TextStyle(
                    fontFamily: AppFonts.nanumGothic,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.width14,
                    color: AppColors.scaffoldBackground,
                  ),
                ),
              ),
            ),
            // if (!kReleaseMode)
            ListTile(
              leading: const Icon(Icons.remove),
              title: TextButton(
                onPressed: () {
                  Get.back();
                  Get.toNamed(SETTING_PATH, arguments: {
                    'isSettingPage': false,
                  });
                },
                child: Text(
                  '데이터 초기화',
                  style: TextStyle(
                    fontFamily: AppFonts.nanumGothic,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.width14,
                    color: AppColors.scaffoldBackground,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPageChanged(int index) {
    selectedCategoryIndex = LocalReposotiry.putBasicOrJlptOrMy(index);
    setState(() {});
  }

  Widget _body(BuildContext context, HomeController homeController) {
    return SafeArea(
        child: Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => homeController.openDrawer(),
            icon: Icon(Icons.settings, size: Responsive.height10 * 2.2),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const WelcomeWidget(),
                const Spacer(flex: 1),
                const NewSearchWidget(),
                const Spacer(flex: 1),
                StudyCategoryNavigator(
                  onTap: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  currentPageIndex: selectedCategoryIndex,
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 25,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemCount: 3,
                    onPageChanged: onPageChanged,
                    itemBuilder: (context, index) {
                      return HomeScreenBody(index: selectedCategoryIndex);
                    },
                  ),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class ToeicGrammarText extends StatelessWidget {
  const ToeicGrammarText({
    super.key,
    required this.title,
    required this.cosi,
    required this.accentContent,
    required this.content,
  });
  final String title;
  final String cosi;
  final String accentContent;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.width10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.height25,
                color: Colors.black,
              ),
            ),
            SizedBox(height: Responsive.height10 * 2),
            Text(
              cosi,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.height20,
                color: Colors.black,
              ),
            ),
            Divider(
              thickness: Responsive.height10 * 0.2,
              height: Responsive.height10 * 3,
              color: AppColors.mainBordColor,
            ),
            Text(
              accentContent,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Responsive.height18,
                color: Colors.red,
              ),
            ),
            SizedBox(height: Responsive.height10),
            content,
            SizedBox(height: Responsive.height10),
          ],
        ),
      ),
    );
  }
}
