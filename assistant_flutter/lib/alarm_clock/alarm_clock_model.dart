const String alarmTable = 'alarm_clock';
const String alarmColumnId = 'id';
const String alarmColumnTitle = 'title';
const String alarmColumnRing = 'ring';
const String alarmColumnRepeat = 'repeat';
const String alarmColumnDateTime = 'alarmDateTime';

class AlarmInfo {
  int? id;
  String? title;
  int ring; // 是否闹铃 0 关闭，1 开启
  int repeat; // 是否重复 0 不重复，1 重复
  DateTime alarmDateTime;

  AlarmInfo({
    this.id,
    this.title,
    required this.ring,
    required this.repeat,
    required this.alarmDateTime,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        ring: json["ring"],
        repeat: json["repeat"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "ring": ring,
        "repeat": repeat,
        "alarmDateTime": alarmDateTime.toIso8601String(),
      };

  @override
  String toString() {
    return 'AlarmInfo{id: $id, name: $title, ring: $ring, repeat: $repeat, alarmDateTime: $alarmDateTime}';
  }
}
