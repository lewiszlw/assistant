import 'package:assistant_flutter/daily_article/daily_article_model.dart';
import 'package:assistant_flutter/preference/preference_data.dart';
import 'package:assistant_flutter/utils/preference_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io' show Platform;


class ArticleHelper {
  var client = http.Client();
  var _preferenceUtil = PreferenceUtil();

  Future<List<ArticleInfo>> fetchArticleInfos() async {
    String serverAddr = _preferenceUtil.getStringOrDefault(prefKeyServerAddr, prefKeyServerAddrDefaultValue);
    if (serverAddr == prefKeyServerAddrDefaultValue) {
      serverAddr = getLocalServerAddr();
    }
    // var uri = Uri.http(serverAddr, "/daily-article/all");
    var uri = Uri.parse(serverAddr + "/daily-article/all");
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

  String getLocalServerAddr() {
    late String localhost;
    // 安卓localhost指向10.0.2.2 https://medium.com/@podcoder/connecting-flutter-application-to-localhost-a1022df63130
    if (Platform.isAndroid) {
      localhost = "http://10.0.2.2:5000";
    } else if (Platform.isIOS) {
      localhost = "http://127.0.0.1:5000";
    }
    return localhost;
  }
}
