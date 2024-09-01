class NetWorkManager {
  // static Future<List<Word>> searchWrod(String word, String category) async {
  //   for (int i = 0; i < word.length; i++) {}
  //   final dio = Dio();

  //   String baseUrl = '';
  //   if (kReleaseMode) {
  //     baseUrl = 'https://wonjongseo-jonggack-company.koyeb.app/';
  //   } else {
  //     baseUrl = 'http://localhost:4000/';
  //   }
  //   // baseUrl = 'https://wonjongseo-jonggack-company.koyeb.app';
  //   String url = '${baseUrl}search';
  //   log('connect to $url');
  //   log('word: $word');

  //   var response = await dio.get(
  //     url,
  //     queryParameters: {
  //       'query': word,
  //     },
  //   );

  //   List<Word> result = [];
  //   List datas = await response.data['data'];

  //   for (int i = 0; i < datas.length; i++) {
  //     Word word = Word.fromMap(datas[i]);
  //     result.add(word);
  //   }

  //   return [];
  // }

  static List getDataToServer(String params) {
    switch (params) {
      case "N1-voca":
        return [];

      case "N2-voca":
        return [];

      case "N3-voca":
        return [];

      case "N4-voca":
        return [];

      case "N5-voca":
        return [];

      case "N1-kangi":
        return [];

      case "N2-kangi":
        return [];
      case "N3-kangi":
        return [];
      case "N4-kangi":
        return [];
      case "N5-kangi":
        return [];
      case "N6-kangi":
        return [];
      case "N1-grammar":
        return [];
      case "N2-grammar":
        return [];
      case "N3-grammar":
        return [];
      case "N4-grammar":
        return [];
      case "N5-grammar":
        return [];
    }
    return [];

    // final dio = Dio();

    // String baseUrl = '';
    // if (kReleaseMode) {
    //   baseUrl = 'https://wonjongseo-jonggack-company.koyeb.app';
    // } else {
    //   baseUrl = 'http://localhost:4000';
    // }
    // // baseUrl = 'https://wonjongseo-jonggack-company.koyeb.app';
    // log('connect to $baseUrl');
    // log('params: $params');
    // var response = await dio.get(
    //   // 'http://localhost:4000',
    //   baseUrl,
    //   queryParameters: {
    //     // 'data': 'N1-voca',
    //     'data': params,
    //   },
    // );
    // var json = await response.data['data'];

    // return [];
  }
}

//https://wonjongseo-jonggack-company.koyeb.app/?data=N1-voca