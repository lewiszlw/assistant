const String alarmTable = 'alarm_clock';
const String alarmColumnId = 'id';
const String alarmColumnTitle = 'title';
const String alarmColumnDateTime = 'alarmDateTime';

class AlarmInfo {
  int? id;
  String? title;
  DateTime? alarmDateTime;

  AlarmInfo({
    this.id,
    this.title,
    this.alarmDateTime,
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> json) => AlarmInfo(
        id: json["id"],
        title: json["title"],
        alarmDateTime: DateTime.parse(json["alarmDateTime"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "alarmDateTime": alarmDateTime!.toIso8601String(),
      };
  
  @override
  String toString() {
    return 'AlarmInfo{id: $id, name: $title, alarmDateTime: $alarmDateTime}';
  }
}
