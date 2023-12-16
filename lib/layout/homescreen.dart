// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_todoproject/modules/archivedtasks.dart';
import 'package:flutter_application_todoproject/modules/donetasks.dart';
import 'package:flutter_application_todoproject/modules/newtasks.dart';
import 'package:flutter_application_todoproject/shared/component/textform.dart';
import 'package:flutter_application_todoproject/shared/constant/constatnt.dart';
import 'package:flutter_application_todoproject/shared/localdatabase/localdatabase.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "New Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: "Done Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: "Archived Tasks")
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors[currentIndex],
        onPressed: () {
          if (isButtonSheetShow) {
            isButtonSheetShow = false;
            Navigator.pop(context);
            setState(() {
              floatingActionbottonIcon = Icon(Icons.edit);
            });
          } else {
            scaffoldKey.currentState!.showBottomSheet((context) => Container(
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultFormField(
                          controller: titleController,
                          type: TextInputType.text,
                          prefix: Icons.title,
                          label: 'Task title',
                          hintText: "Enter task title",
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Title cannot be empty';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      defaultFormField(
                          controller: timeController,
                          type: TextInputType.datetime,
                          prefix: Icons.watch_later_outlined,
                          label: "Task Time",
                          hintText: "Enter Task Time",
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Time cannot be empty';
                            }
                            return null;
                          })
                    ],
                  ),
                ));
            isButtonSheetShow = true;
            setState(() {
              floatingActionbottonIcon = Icon(Icons.add);
            });
          }
        },
        child: floatingActionbottonIcon,
      ),
      appBar: AppBar(
        backgroundColor: colors[currentIndex],
        title: Text(titles[currentIndex]),
        leading: icons[currentIndex],
      ),
      body: screens[currentIndex],
    );
  }
}
