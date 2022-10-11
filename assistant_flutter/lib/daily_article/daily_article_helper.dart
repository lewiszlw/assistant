import 'package:assistant_flutter/daily_article/daily_article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io' show Platform;


class ArticleHelper {
  var client = http.Client();

  Future<List<ArticleInfo>> fetchArticleInfos() async {
    // 安卓localhost指向10.0.2.2 https://medium.com/@podcoder/connecting-flutter-application-to-localhost-a1022df63130
    var localhost;
    if (Platform.isAndroid) {
      localhost = "10.0.2.2";
    } else if (Platform.isIOS) {
      localhost = "127.0.0.1";
    }
    var uri = Uri.http("${localhost}:5000", "/daily-article/all");
    print("fetchArticleInfos uri: $uri");
    var response = await client.get(uri);
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    if (response.statusCode == 200) {
      var jsonList = convert.jsonDecode(response.body) as List<dynamic>;
      print("fetchArticleInfos response body: $jsonList");
      List<ArticleInfo> result = [];
      for (var item in jsonList) {
        result.add(ArticleInfo.fromMap(item));
      }
      return result;
    } else {
      print('fetchArticleInfos failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
