import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/view/main_screens/homeScreen/calender_screen.dart';
import 'package:todo/view/main_screens/profileScreen/profile_screen.dart';

class Homescreen extends StatelessWidget {
  Homescreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd MMM');
    String formattedDate = formatter.format(now);
    String name = box.get('name') == null ? 'Name' : box.get('name');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello $name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      )),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalenderScreen(),
                      )),
                  child: Container(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.task_alt_outlined, color: Colors.white),
                          SizedBox(width: 15),
                          Text(
                            '10 tasks to do today',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

final box = Hive.box(AppSessions.TodoData);

String name = box.get('name');
