import 'package:flutter/material.dart';
import 'package:todo/utils/global_variables.dart';
import 'package:todo/view/main_screens/taskAddScreen/tabBar_items/reminderBar.dart';
import 'package:todo/view/main_screens/taskAddScreen/tabBar_items/tasksBar.dart';
import 'package:todo/view/main_screens/taskAddScreen/screenElements/floatingButton.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: floatingButton(context),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create\nNew Task',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 45),
              ),
              Text(
                'You have to complete $numberOfTasks task today',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              TabBar(
                  isScrollable: true,
                  labelPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(color: Colors.grey),
                  indicatorColor: Colors.black,
                  splashFactory: NoSplash.splashFactory,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  enableFeedback: true,
                  tabs: [
                    Text(
                      'Tasks(12)',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'Reminders(15)',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ]),
              Expanded(child: TabBarView(children: [Tasksbar(), Reminderbar()]))
            ],
          ),
        )),
      ),
    );
  }
}
