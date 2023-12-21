// ignore_for_file: unused_element, dead_code

import 'package:flutter_application_todoproject/shared/constant/constatnt.dart';
import 'package:sqflite/sqflite.dart';

////////////////////////////////////***** createDataBase() ***************///////////////////////////////////
void createDataBase() async {
  database = await openDatabase(
    "todo.db",
    version: 1,
    onCreate: (database, version) {
      database
          .execute(
              "CREATE TABLE todotable (id INTEGER PRIMARY KEY, title TEXT, date TEXT ,time TEXT,status TEXT)")
          .then((value) {
        print("table created successfully");
      }).catchError((onError) {
        print("error creating failed $onError");
      });
    },
    onOpen: (database) {
      getDataFromDataBase(database).then((value) {
        tasks = value;
        print(tasks);
      });
      print("database opened successfully");
    },
  );
}

////////////////////////////////////*****insertDataBase() ***************///////////////////////////////////
Future insertDataBase(
    {required String tite, required String date, required String time}) async {
  return await database.transaction((txn) {
    return txn.rawInsert(
        "INSERT INTO todotable (title,date,time,status) VALUES ('$tite','$date','$time','new')");
  }).then((value) {
    print("raw inserted $value");
  }).catchError((onError) {
    print("error inserting $onError");
  });
}

/////////////////////////////////////getDataBase() ***************////////////////////////////////
Future<List<Map>> getDataFromDataBase(database) async {
  return await database.rawQuery("SELECT * FROM todotable");
}
