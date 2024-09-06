import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/utils/imageConstants.dart';
import 'package:todo/view/main_screens/controller_screen.dart';
import 'package:todo/view/widgets/buttonContainer.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(AppSessions.TodoData);

    final dateController = TextEditingController();
    final nameController = TextEditingController();
    final key = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: key,
              child: ListView(
                children: [
                  SizedBox(height: 40),
                  Text(
                    textAlign: TextAlign.center,
                    'TODO Login',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  SizedBox(height: 20),
                  Image.asset(Imageconstants.loginImage),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Add your name';
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: Colors.black),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Add your date of birth';
                      } else {
                        return null;
                      }
                    },
                    controller: dateController,
                    cursorColor: Colors.black,
                    readOnly: true,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              var selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now());
                              if (selectedDate != null) {
                                dateController.text = DateFormat('dd/MM/yyyy')
                                    .format(selectedDate);
                              }
                            },
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.black,
                            )),
                        labelText: 'Date of Birth',
                        labelStyle: TextStyle(color: Colors.black),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                  SizedBox(height: 20),
                  ButtonContainer(
                    text: 'Save',
                    onTap: () {
                      if (key.currentState!.validate()) {
                        // Store data with specific keys
                        box.put('name', nameController.text);
                        box.put('dob', dateController.text);

                        // Retrieve and print data using correct keys
                        print(box.get('name'));
                        print(box.get('dob'));

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ControllerScreen(),
                            ));
                      }
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
