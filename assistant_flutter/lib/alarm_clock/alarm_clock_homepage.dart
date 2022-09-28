import 'package:assistant_flutter/alarm_clock/models/alarm_info.dart';
import 'package:assistant_flutter/alarm_clock/theme_data.dart';
import 'package:flutter/material.dart';

/// 即时闹钟首页
class AlarmClockHomepage extends StatefulWidget {
  AlarmClockHomepage({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmClockHomepageState();
}

class _AlarmClockHomepageState extends State<AlarmClockHomepage> {
  List<AlarmInfo>? alarmInfos;

  @override
  void initState() {
    // TODO 读取数据库
    alarmInfos = [];
    alarmInfos!.add(AlarmInfo(
        id: 1,
        title: "标题1",
        alarmDateTime: DateTime.now(),
        isPending: false,
        gradientColorIndex: 1));
    alarmInfos!.add(AlarmInfo(
        id: 2,
        title: "标题2",
        alarmDateTime: DateTime.now(),
        isPending: false,
        gradientColorIndex: 2));
    alarmInfos!.add(AlarmInfo(
        id: 3,
        title: "标题3",
        alarmDateTime: DateTime.now(),
        isPending: false,
        gradientColorIndex: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("即时闹钟"),
      ),
      body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              AlarmItem(
                alarmInfo: alarmInfos![0],
              ),
              AlarmItem(
                alarmInfo: alarmInfos![1],
              ),
              AlarmItem(
                alarmInfo: alarmInfos![2],
              ),
            ],
          )),
    );
  }
}

class AlarmItem extends StatefulWidget {
  AlarmItem({super.key, required this.alarmInfo});

  AlarmInfo alarmInfo;

  @override
  State<StatefulWidget> createState() => _AlarmItemState(alarmInfo: alarmInfo);
}

class _AlarmItemState extends State<AlarmItem> {
  _AlarmItemState({required this.alarmInfo});

  AlarmInfo alarmInfo;

  @override
  Widget build(BuildContext context) {
    var gradientColors =
        GradientTemplate.gradientTemplate[alarmInfo.gradientColorIndex!].colors;

    return Container(
      // color: Colors.grey,
      margin: const EdgeInsets.only(
          top: 10, bottom: 10, left: 10, right: 10), // 容器外补白
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2), // 容器内补白
      decoration: BoxDecoration(
        // 背景装饰
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(4, 4),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.label,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "闹钟名称",
                    style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
                  ),
                ],
              ),
              Switch(
                onChanged: (bool value) {
                  print("闹钟切换");
                },
                value: true,
                activeColor: Colors.white,
              ),
            ],
          ),
          const Text(
            'Mon-Fri',
            style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "闹钟时间",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'avenir',
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.white,
                  onPressed: () {
                    print("TODO");
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
