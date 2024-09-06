import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}


class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final ProfileDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text(
                            'Name',
                            style: TextStyle(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  SizedBox(width: 10),
                  nameController.text.length > 0
                      ? Container(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black,
                          ),
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text(
                            'Email',
                            style: TextStyle(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  SizedBox(width: 10),
                  emailController.text.length > 0
                      ? Container(
                          height: 50,
                          width: 80,
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black,
                          ),
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: ProfileDateController,
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
                                  ProfileDateController.text =
                                      DateFormat('dd/MM/yyyy')
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
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
