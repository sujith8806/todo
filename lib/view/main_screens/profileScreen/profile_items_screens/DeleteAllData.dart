import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/database.dart';
import 'package:todo/utils/global_variables.dart';
import 'package:todo/utils/imageConstants.dart';
import 'package:todo/view/widgets/buttonContainer.dart';

class Deletealldata extends StatelessWidget {
  Deletealldata({super.key});
  final box = Hive.box(AppSessions.TodoData);
  // set up the AlertDialog

  @override
  Widget build(BuildContext context) {
    var taskbox = Hive.box(AppSessions.TodoData);

    AlertDialog alert = AlertDialog(
      title: Text("Delete App Datas"),
      content: Text("Do you want delete your all Datas?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            )),
        TextButton(
            onPressed: () {
              box.clear();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.black,
                  content: Text(
                    'All data has been deleted',
                    style: TextStyle(color: Colors.white),
                  )));
              tasksDataList = taskbox.keys.toList();
            },
            child: Text(
              'Confirm',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Delete Data',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage(Imageconstants.deleteImage)),
                Text(
                  'Do you want delete all Datas?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Deleting datas will include the follwing factors',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    Database.deleteScreenDatas.length,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Database.deleteScreenDatas[index]['title'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 17),
                          child: Text(
                              Database.deleteScreenDatas[index]['message']),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ButtonContainer(
                    text: 'Delete all datas',
                    onTap: () {
                      showDialog(context: context, builder: (context) => alert);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
