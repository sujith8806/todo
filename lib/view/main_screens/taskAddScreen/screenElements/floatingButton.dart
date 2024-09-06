import 'package:flutter/material.dart';
import 'package:todo/view/main_screens/taskAddScreen/screenElements/bottemSheet.dart';

FloatingActionButton floatingButton(BuildContext context) {
  return FloatingActionButton(
    elevation: 10,
    splashColor: Colors.white.withOpacity(0.2),
    onPressed: () {
      bottemSheet(context);
    },
    child: Icon(
      Icons.add,
      color: Colors.white,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    backgroundColor: Colors.black,
  );
}
