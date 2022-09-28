import 'package:assistant_flutter/alarm_clock/alarm_clock_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'homepage.dart';

class AssistantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        "alarm_clock_homepage": (context) => AlarmClockHomepage(),
      },
    );
  }
}

void main() => runApp(AssistantApp());