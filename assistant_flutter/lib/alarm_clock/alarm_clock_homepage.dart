import 'package:flutter/material.dart';
import 'alarm_clock_helper.dart';
import 'alarm_clock_model.dart';
import 'theme_data.dart';

/// 即时闹钟首页

typedef DeleteAlarmCallback = void Function(int alarmId);

class AlarmClockHomepage extends StatefulWidget {
  AlarmClockHomepage({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmClockHomepageState();
}

class _AlarmClockHomepageState extends State<AlarmClockHomepage> {
  List<AlarmInfo> currentAlarmInfos = [];
  AlarmHelper _alarmHelper = AlarmHelper();

  @override
  void initState() {
    // 初始化数据库
    _alarmHelper.initializeDatabase().then((value) {
      print("alarm_clock database initialized.");
      loadAlarmInfos();
    });
    super.initState();
  }

  void loadAlarmInfos() {
    _alarmHelper.getAlarms().then((result) {
      print("load alarms: $result");
      setState(() {
        currentAlarmInfos = result;
      });
    });
  }

  // 构建闹钟widget列表
  ListView buildAlarmItemsListView() {
    return ListView(
        key: UniqueKey(), // 否则list更新会有问题
        children: currentAlarmInfos
            .map((e) => AlarmItemWidget(
                  alarmInfo: e,
                  deleteAlarmCallback: deleteAlarmInfo,
                ))
            .toList());
  }

  // 新增闹钟
  void insertAlarmInfo(String title, DateTime alarmDateTime) {
    _alarmHelper.insertAlarm(AlarmInfo(
      title: title,
      alarmDateTime: alarmDateTime,
    ));
    loadAlarmInfos();
  }

  // 删除闹钟
  void deleteAlarmInfo(int id) {
    _alarmHelper.delete(id);
    loadAlarmInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("即时闹钟"),
      ),
      body: Container(
        color: Colors.white,
        child: buildAlarmItemsListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("新增闹钟");
          insertAlarmInfo("测试", DateTime.now());
        },
        tooltip: "Create new one",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AlarmItemWidget extends StatefulWidget {
  AlarmItemWidget(
      {super.key, required this.alarmInfo, required this.deleteAlarmCallback});

  AlarmInfo alarmInfo;
  DeleteAlarmCallback deleteAlarmCallback;

  @override
  State<StatefulWidget> createState() =>
      _AlarmItemWidgetState(alarmInfo: alarmInfo);
}

class _AlarmItemWidgetState extends State<AlarmItemWidget> {
  _AlarmItemWidgetState({required this.alarmInfo});

  AlarmInfo alarmInfo;

  @override
  Widget build(BuildContext context) {
    var gradientColors = GradientTemplate.gradientTemplate[1].colors;

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
                children: <Widget>[
                  Icon(
                    Icons.label,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "闹钟名称 id ${alarmInfo.id!}",
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
                    print("删除闹钟 ${alarmInfo.id}");
                    widget.deleteAlarmCallback(alarmInfo.id!);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
