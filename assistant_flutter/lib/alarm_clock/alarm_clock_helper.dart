import 'package:sqflite/sqflite.dart';
import 'alarm_clock_model.dart';

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    _alarmHelper ??= AlarmHelper._createInstance(); // 如为空则被赋值，反之则保持当前值
    return _alarmHelper!;
  }

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = "${dir}alarm_clock.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $alarmTable ( 
          $alarmColumnId integer primary key autoincrement, 
          $alarmColumnTitle text not null,
          $alarmColumnRing integer not null,
          $alarmColumnDateTime text not null)
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await database;
    var result = await db.insert(alarmTable, alarmInfo.toMap());
    print('insertAlarm result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> alarms = [];

    var db = await database;
    var result = await db.query(alarmTable);
    for (var element in result) {
      var alarmInfo = AlarmInfo.fromMap(element);
      alarms.add(alarmInfo);
    }
    return alarms;
  }

  Future<int> delete(int id) async {
    var db = await database;
    return await db
        .delete(alarmTable, where: '$alarmColumnId = ?', whereArgs: [id]);
  }

  Future<int> update(AlarmInfo alarmInfo) async {
    var db = await database;
    return await db.update(alarmTable, alarmInfo.toMap(), where: '$alarmColumnId = ?', whereArgs: [alarmInfo.id]);
  }
}
