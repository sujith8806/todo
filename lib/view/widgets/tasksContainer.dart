import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/utils/global_variables.dart';

class ContanierWidget extends StatefulWidget {
  const ContanierWidget({
    super.key,
  });

  @override
  State<ContanierWidget> createState() => _ContanierWidgetState();
}

class _ContanierWidgetState extends State<ContanierWidget> {
  var taskbox = Hive.box(AppSessions.TodoData);
  @override
  void initState() {
    tasksDataList = taskbox.keys.toList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedDate = DateTime.now();
    String currentDate =
        DateFormat('dd/mm/yyyy').format(selectedDate).toString();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskbox.get('taskName').toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                taskbox.get('taskDate').toString(),
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                taskbox.get('taskDescription').toString(),
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sports_gymnastics,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Gym',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}
