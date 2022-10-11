import 'package:assistant_flutter/alarm_clock/alarm_clock_homepage.dart';
import 'package:assistant_flutter/comming_soon_page.dart';
import 'package:assistant_flutter/preference/preference_homepage.dart';
import 'package:assistant_flutter/utils/preference_util.dart';
import 'package:flutter/material.dart';
import 'daily_article/daily_article_homepage.dart';
import 'homepage.dart';
import 'utils/notification_util.dart';

class AssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      routes: {
        "alarm_clock_homepage": (context) => AlarmClockHomepage(),
        "daily_article_homepage": (context) => DailyArticleHomepage(),
        "preference_homepage":(context) => PreferenceHomepage(),
        "comming_soon_page": (context) => CommingSoonPage(),
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 flutter_local_notifications
  await configureLocalTimeZone();
  NotificationUtil().init();

  // 初始化 shared_preferences
  PreferenceUtil().init();

  runApp(AssistantApp());
}