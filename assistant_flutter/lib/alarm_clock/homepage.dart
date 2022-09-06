import 'package:flutter/material.dart';
import 'data/theme_data.dart';
import 'alarm_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Row(
        children: <Widget>[
          Expanded(
            child: AlarmPage()
          ),
        ],
      ),
    );
  }
}
