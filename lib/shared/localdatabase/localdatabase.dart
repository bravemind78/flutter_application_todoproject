import 'package:flutter_application_todoproject/shared/constant/constatnt.dart';
import 'package:sqflite/sqflite.dart';

void createDataBase() async {
  database = await openDatabase(
    "todo.db",
    version: 1,
    onCreate: (db, version) {
      db
          .execute(
              "CREATE TABLE todotable (id INTEGER PRIMARY KEY, title TEXT, date TEXT ,time TEXT,status TEXT)")
          .then((value) {
        print("table created successfully");
      }).catchError((onError) {
        print("error creating failed $onError");
      });
    },
    onOpen: (db) {
      print("database opened successfully");
    },
  );
}

void insertDataBase() {
  database.transaction((txn) {
    return txn.rawInsert(
        "INSERT INTO todotable (title,date,time,status) VALUES ('First Task','15/12/2023','9:15','new')");
  }).then((value) {
    print("raw inserted $value");
  }).catchError((onError) {
    print("error inserting $onError");
  });
}
