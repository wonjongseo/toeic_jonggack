import 'dart:async';
import 'package:jonggack_toeic_japanese/common/common.dart';
import 'package:jonggack_toeic_japanese/repository/kangis_step_repository.dart';
import 'package:jonggack_toeic_japanese/repository/toeic_chatper5_step_repository.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_toeic_japanese/common/admob/controller/ad_controller.dart';
import 'package:jonggack_toeic_japanese/features/home/screens/home_screen.dart';
import 'package:jonggack_toeic_japanese/config/theme.dart';
import 'package:jonggack_toeic_japanese/model/user.dart';
import 'package:jonggack_toeic_japanese/repository/jlpt_step_repository.dart';
import 'package:jonggack_toeic_japanese/repository/local_repository.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jonggack_toeic_japanese/routes.dart';
import 'package:jonggack_toeic_japanese/user/controller/user_controller.dart';
import 'package:jonggack_toeic_japanese/user/repository/user_repository.dart';

import 'features/setting/services/setting_controller.dart';

/*
 유료버전과 무료버전 업로드 시 .

STEP 1. 프로젝트 명 반드시 바꾸기!!
JLPT 종각
  JLPT 종각 => flutter pub run change_app_package_name:main com.wonjongseo.jlpt_jonggack
  JLPT 종각 Plus => flutter pub run change_app_package_name:main com.wonjongseo.jlpt_jonggack_plus

STEP 2. 앱 이름 바꾸기 
  JLPT 종각 <-> JLPT 종각 Plus

STEP 2-1. 번들 이름 바꾸기 

  japanese_voca <-> japanese_voca_plus

OS Path- ios/Runner/Info.plist
 Android Path- android/app/src/main/AndroidManifest.xml

STEP 3.
  앱 아이콘 바꾸기

STEP 4. 
  User isPremieum = false <-> true

STEP 5. 
  버전 바꾸기
  

Android Command - flutter build appbundle
Hive - flutter pub run build_runner build --delete-conflicting-outputs
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, snapshat) {
        if (snapshat.hasData == true) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: HOME_PATH,
            getPages: AppRoutes.getPages,
            theme: AppThemings.lightTheme,
          );
        } else if (snapshat.hasError) {
          return errorMaterialApp(snapshat);
        } else {
          return loadingMaterialApp(context);
        }
      },
    );
  }

  Future<bool> loadData() async {
    List<int> jlptWordScroes = [];
    List<int> grammarScores = [1, 1, 1, 1, 1];
    List<int> kangiScores = [];
    try {
      await LocalReposotiry.init();

      // if (true) {
      if (await JlptStepRepositroy.isExistData() == false) {
        jlptWordScroes.add(await JlptStepRepositroy.init('500'));
        jlptWordScroes.add(await JlptStepRepositroy.init('700'));
        jlptWordScroes.add(await JlptStepRepositroy.init('900'));
        // 熟語
        jlptWordScroes.add(await JlptStepRepositroy.init(oneTo3000List[0]));
        kangiScores.add(await KangiStepRepositroy.init('500'));
        kangiScores.add(await KangiStepRepositroy.init('700'));
        kangiScores.add(await KangiStepRepositroy.init('900'));

        ToeicChapter5StepRepositroy.init('1');

        //
      } else {
        //　よく出る3000個単語
        List<int> words = [538, 935, 1648];
        jlptWordScroes.addAll(words);

        List<int> idiom = [196, 301, 507];

        jlptWordScroes.addAll(idiom);

        List<int> yokuderuWord = List.generate(10, (index) => 300);

        jlptWordScroes.addAll(yokuderuWord);
      }

      late User user;

      if (await UserRepository.isExistData() == false) {
        // if (true) {
        List<int> currentJlptWordScroes =
            List.generate(jlptWordScroes.length, (index) => 0);
        List<int> currentGrammarScores =
            List.generate(grammarScores.length, (index) => 0);
        List<int> currentKangiScores =
            List.generate(kangiScores.length, (index) => 0);

        user = User(
          jlptWordScroes: jlptWordScroes,
          grammarScores: grammarScores,
          kangiScores: kangiScores,
          currentJlptWordScroes: currentJlptWordScroes,
          currentGrammarScores: currentGrammarScores,
          currentKangiScores: currentKangiScores,
        );

        user = await UserRepository.init(user);
        if (!LocalReposotiry.isAskUpdateAllDataFor2_3_3()) {
          LocalReposotiry.putIsNeedUpdateAllData(false);
          LocalReposotiry.askedUpdateAllDataFor2_3_3(true);
        }
      } else {
        if (!LocalReposotiry.isAskUpdateAllDataFor2_3_3()) {
          LocalReposotiry.putIsNeedUpdateAllData(true);
          LocalReposotiry.askedUpdateAllDataFor2_3_3(true);
        }
      }

      UserController userController = Get.put(UserController());
      userController.user.isPad = await isIpad();

      Get.put(AdController());

      Get.put(SettingController());
    } catch (e) {
      rethrow;
    }
    return true;
  }

  MaterialApp loadingMaterialApp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '데이터를 불러오는 중입니다.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 25),
                builder: (context, value, child) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 250,
                        child: LinearProgressIndicator(
                          backgroundColor: const Color(0xFF191923),
                          value: value,
                          color: const Color(0xFFFFC107),
                        ),
                      ),
                      const SizedBox(height: 16 / 2),
                      Text('${(value * 100).toInt()}%')
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  MaterialApp errorMaterialApp(AsyncSnapshot<bool> snapshat) {
    String errorMsg = snapshat.error.toString();
    if (errorMsg.contains('Connection refused')) {
      errorMsg = '서버와 연결이 불안정 합니다. 데이터 연결 혹은 Wifi 환경에서 다시 요청해주시기 바랍니다.';
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JLPT종각 앱 이용 하기 앞서,',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    '데이터를 저장하기 위해 1회 서버와 연결을 해야합니다.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '데이터 연결 혹은 와이파이 환경에서 다시 요청해주시기 바랍니다.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                errorMsg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> oneTo3000List = [
  '1~300',
  '301~600',
  '601~900',
  '901~1200',
  '1201~1500',
  '1501~1800',
  '1801~2100',
  '2101~2400',
  '2401~2700',
  '2701~3000',
];

List<String> fiveToNineHundredList = [
  '500',
  '700',
  '900',
];

List<String> fiveToNineHhousandList = [
  '5000',
  '7000',
  '9000',
];
