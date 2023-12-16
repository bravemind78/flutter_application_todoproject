// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Archived tasks",
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
