import 'dart:async';

import 'package:boilerplate_flutter_nafanesia/data/local/database_helper.dart';
import 'package:boilerplate_flutter_nafanesia/models/user.dart';
import 'package:sqflite/sqflite.dart';

class Sqlite {
  Sqlite() {
    initSqlite();
  }

  Database _db;

  StreamController<User> userController = StreamController<User>();

  void initSqlite() async {
    _db = await DatabaseHelper.initDatabase();
  }

  void addUserStreamController(User user) {
    if (userController.isClosed) {
      userController = StreamController<User>();
    }
    userController.add(user);
    userController.close();
  }

  Future<void> insertUser(User user) async {
    await _db.insert(DatabaseHelper.tableUser, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<User> getUser() async {
    List<Map<String, dynamic>> results =
        await _db.query(DatabaseHelper.tableUser);

    if (results.length > 0) {
      return User.fromJson(results.first);
    }
    return null;
  }

  Future<void> deleteUser() async {
    await _db.delete(DatabaseHelper.tableUser);
  }
}
