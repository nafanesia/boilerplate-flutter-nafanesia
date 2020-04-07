import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String _databaseName = "my_database.db";
  static final int _databaseVersion = 1;

  static String tableUser = "user";

  static Future<Database> initDatabase() async {
    return openDatabase(join(await getDatabasesPath(), _databaseName),
        onCreate: (db, version) {
      db.execute(
          "CREATE TABLE $tableUser(id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT)");
    }, version: _databaseVersion);
  }
}
