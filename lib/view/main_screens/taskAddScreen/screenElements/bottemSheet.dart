import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/utils/global_variables.dart';
import 'package:todo/view/main_screens/taskAddScreen/screenElements/dropDownButton.dart';
import 'package:todo/view/widgets/tasksContainer.dart';

PersistentBottomSheetController bottemSheet(BuildContext context) {
  String? dropValue;
  final taskNameController = TextEditingController();
  final taskDateController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  var taskbox = Hive.box(AppSessions.TodoData);

  return showBottomSheet(
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Add a New Task',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: taskNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Enter a Task Ex: Gym at 5pm',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.task_alt_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            'Task Name',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(height: 10),
                dropDwonButton(dropValue, setState),
                SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty && value != null) {
                      return null;
                    } else {
                      return 'Add your date of birth';
                    }
                  },
                  controller: taskDateController,
                  cursorColor: Colors.black,
                  readOnly: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () async {
                            var selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1950),
                                lastDate: DateTime.now());
                            if (selectedDate != null) {
                              taskDateController.text =
                                  DateFormat('dd MMM').format(selectedDate);
                            }
                          },
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black,
                          )),
                      labelText: 'Select date',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: taskDescriptionController,
                  maxLines: 4,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Enter a breif Description about your task',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.black)),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.task_alt_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: InkWell(
                    onTap: () {

                      taskbox.put('taskName', taskNameController.text);
                      taskbox.put('taskDate', taskDateController.text);
                      taskbox.put('taskDescription', taskDescriptionController.text);
                   

                      Navigator.pop(context);
                      tasksDataList = taskbox.keys.toList();
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

