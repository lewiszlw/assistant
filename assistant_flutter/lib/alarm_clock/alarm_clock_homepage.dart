// import 'package:assistant_flutter/utils/notification_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'alarm_clock_helper.dart';
import 'alarm_clock_model.dart';
import 'theme_data.dart';
import '../utils/notification_util.dart';

/// 即时闹钟首页

typedef DeleteAlarmCallback = void Function(int alarmId);
typedef UpdateAlarmCallback = void Function(AlarmInfo alarmInfo);

class AlarmClockHomepage extends StatefulWidget {
  AlarmClockHomepage({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmClockHomepageState();
}

class _AlarmClockHomepageState extends State<AlarmClockHomepage> {
  List<AlarmInfo> currentAlarmInfos = [];
  AlarmHelper _alarmHelper = AlarmHelper();
  DateTime? _alarmTime;
  String _alarmTimeString = "";
  bool _isRepeatSelected = false;
  String _inputedTitle = "";

  @override
  void initState() {
    _alarmTime = DateTime.now();
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

  // 新增闹钟
  void insertAlarmInfo(String title, bool repeat, DateTime alarmDateTime) {
    _alarmHelper.insertAlarm(AlarmInfo(
      title: title,
      ring: 1,
      repeat: repeat ? 1 : 0,
      alarmDateTime: alarmDateTime,
    ));
    loadAlarmInfos();
  }

  // 删除闹钟
  void deleteAlarmInfo(int id) {
    _alarmHelper.delete(id);
    loadAlarmInfos();
  }

  void updateAlarmInfo(AlarmInfo alarmInfo) {
    _alarmHelper.update(alarmInfo);
    loadAlarmInfos();
  }

  // 构建闹钟widget列表
  ListView buildAlarmItemsListView() {
    return ListView(
        key: UniqueKey(), // 否则list更新会有问题
        physics: const AlwaysScrollableScrollPhysics(),
        children: currentAlarmInfos
            .map((e) => AlarmItemWidget(
                  alarmInfo: e,
                  deleteAlarmCallback: deleteAlarmInfo,
                  updateAlarmCallback: updateAlarmInfo,
                ))
            .toList());
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
          // 重置字段
          _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
          _isRepeatSelected = false;
          _inputedTitle = "";

          // 用于在底部打开弹框的效果
          showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            constraints: BoxConstraints(maxHeight: 300),
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            var selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              final now = DateTime.now();
                              var selectedDateTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  selectedTime.hour,
                                  selectedTime.minute);
                              _alarmTime = selectedDateTime;
                              setModalState(() {
                                _alarmTimeString = DateFormat('HH:mm')
                                    .format(selectedDateTime);
                              });
                            }
                          },
                          child: Text(
                            _alarmTimeString,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                        ListTile(
                          title: Text('Repeat'),
                          trailing: Switch(
                            onChanged: (value) {
                              setModalState(() {
                                _isRepeatSelected = value;
                              });
                            },
                            value: _isRepeatSelected,
                          ),
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Alarm Title",
                            prefixIcon: Icon(Icons.title),
                          ),
                          onChanged: (value) {
                            print("输入闹钟title: ${value}");
                            _inputedTitle = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            print("新增闹钟");
                            insertAlarmInfo(
                                _inputedTitle, _isRepeatSelected, _alarmTime!);
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.alarm),
                          label: Text('Save'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        tooltip: "Create new one",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AlarmItemWidget extends StatelessWidget {
  AlarmItemWidget(
      {super.key,
      required this.alarmInfo,
      required this.deleteAlarmCallback,
      required this.updateAlarmCallback});

  AlarmInfo alarmInfo;
  DeleteAlarmCallback deleteAlarmCallback;
  UpdateAlarmCallback updateAlarmCallback;

  @override
  Widget build(BuildContext context) {
    var gradientColors = GradientTemplate.getGradientColors(alarmInfo.id!);

    return Container(
      margin: const EdgeInsets.only(
          top: 10, bottom: 10, left: 10, right: 10), // 容器外补白
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2), // 容器内补白
      // 背景装饰
      decoration: BoxDecoration(
        // 背景渐变
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          // 阴影
          BoxShadow(
            color: gradientColors.last.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(4, 4),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(24)), // 圆角
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.label,
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${alarmInfo.title} id ${alarmInfo.id!}",
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'avenir'),
                  ),
                ],
              ),
              Switch(
                onChanged: (bool value) {
                  print("闹钟切换");
                  alarmInfo.ring = value ? 1 : 0;
                  updateAlarmCallback(alarmInfo);
                },
                value: alarmInfo.ring == 1 ? true : false,
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
              Text(
                DateFormat('HH:mm').format(alarmInfo.alarmDateTime),
                style: const TextStyle(
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
                    deleteAlarmCallback(alarmInfo.id!);
                    zonedScheduleNotification(
                        "即时闹钟", alarmInfo.title ?? "", alarmInfo.alarmDateTime);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
