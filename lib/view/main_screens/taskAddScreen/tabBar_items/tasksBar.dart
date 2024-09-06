import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/utils/global_variables.dart';
import 'package:todo/view/widgets/tasksContainer.dart';

class Tasksbar extends StatefulWidget {
  const Tasksbar({super.key});

  @override
  State<Tasksbar> createState() => _TasksbarState();
}

class _TasksbarState extends State<Tasksbar> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var taskbox = Hive.box(AppSessions.TodoData);
    return Scaffold(
      backgroundColor: Colors.white,
      body: tasksDataList.length == 0
          ? Center(
              child: Text(
                textAlign: TextAlign.center,
                'You dont have any tasks\nClick the + button to add a new task',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ContanierWidget(),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10),
                        itemCount: 1),
                  ),
                ],
              ),
            ),
    );
  }
}
