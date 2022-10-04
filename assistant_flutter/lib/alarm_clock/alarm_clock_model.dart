const String alarmTable = 'alarm_clock';
const String alarmColumnId = 'id';
const String alarmColumnTitle = 'title';
const String alarmColumnRing = 'ring';
const String alarmColumnDateTime = 'alarmDateTime';


class AlarmInfo {
  int? id;
  String? title;
  int ring;  // 0 关闭，1 开启
  DateTime? alarmDateTime;

  AlarmInfo({
    this.id,
    this.title,
    required this.ring,
    this.alarmDateTime,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        ring: json["ring"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "ring": ring,
        "alarmDateTime": alarmDateTime!.toIso8601String(),
      };
  
  @override
  String toString() {
    return 'AlarmInfo{id: $id, name: $title, ring: $ring, alarmDateTime: $alarmDateTime}';
  }
}
