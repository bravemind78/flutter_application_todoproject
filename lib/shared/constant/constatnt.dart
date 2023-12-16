import 'package:flutter/material.dart';
import 'package:flutter_application_todoproject/modules/archivedtasks.dart';
import 'package:flutter_application_todoproject/modules/donetasks.dart';
import 'package:flutter_application_todoproject/modules/newtasks.dart';
import 'package:sqflite/sqflite.dart';

var titleController = TextEditingController();
var timeController = TextEditingController();
int currentIndex = 0;
late Database database;
bool isButtonSheetShow = false;
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
Icon floatingActionbottonIcon = Icon(Icons.edit);
List<Widget> screens = [
  const NewTasks(),
  const DoneTasks(),
  const ArchivedTasks()
];
List<String> titles = ["New Tasks", "Done Tasks", "Archived Tasks"];
List<Icon> icons = [
  const Icon(Icons.add),
  const Icon(Icons.check),
  const Icon(Icons.archive_outlined)
];
List<Color> colors = [Colors.blue, Colors.green, Colors.red];
