import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/database.dart';
import 'package:todo/view/main_screens/profileScreen/profile_items_screens/edit_profile.dart';
import 'package:todo/view/widgets/TileList.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var taskbox = Hive.box(AppSessions.TodoData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(),
                    ));
              },
              icon: Icon(
                Icons.edit,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 50,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Sujith',
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(taskbox.get('dob').toString()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: List.generate(
                  Database.profileDataList.length,
                  (index) => InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Database.ProfileScreenList[index]));
                    },
                    child: Tilelist(
                        label: Database.profileDataList[index]['label'],
                        tileIcon: Database.profileDataList[index]['icon']),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
