import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
//   const MyDatabase({Key? key}) : super(key: key);
//
//   @override
//   _MyDatabaseState createState() => _MyDatabaseState();
// }
//
// class _MyDatabaseState extends State<MyDatabase> {
//   final _formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Center();
//   }
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'data.db');
    return await openDatabase(databasePath);
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "data.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/database', 'data.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }

  Future<List<Map<String, dynamic>>> getDetails() async {
    Database db = await initDatabase();
    List<Map<String, dynamic>> userList = await db.rawQuery(
        "select * from User");
    return userList;
  }

  Future<int> insertRecord(Map<String, Object?> map) async {
    Database db = await initDatabase();
    int insert = await db.insert("User", map);
    return insert;
  }

  Future<int> deleteUser(id) async {
    Database db = await initDatabase();
    var res = await db.delete("User", where: "UserID = ?", whereArgs: [id]);
    return res;
  }

  Future<int> editUser(Map<String, Object?> map, id) async {
    Database db = await initDatabase();

    var res = await db.update(
        "User", map, where: "UserID = ?", whereArgs: [id]);
    return res;
  }
}