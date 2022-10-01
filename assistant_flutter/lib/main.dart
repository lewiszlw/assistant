import 'package:assistant_flutter/alarm_clock/alarm_clock_homepage.dart';
import 'package:assistant_flutter/comming_soon_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'homepage.dart';

class AssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      routes: {
        "alarm_clock_homepage": (context) => AlarmClockHomepage(),
        "comming_soon_page": (context) => CommingSoonPage(),
      },
    );
  }
}

void main() async => runApp(AssistantApp());