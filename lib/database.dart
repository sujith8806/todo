import 'package:flutter/material.dart';
import 'package:todo/view/main_screens/profileScreen/profile_items_screens/DeleteAllData.dart';
import 'package:todo/view/main_screens/profileScreen/profile_items_screens/aboutUs.dart';
import 'package:todo/view/main_screens/profileScreen/profile_items_screens/edit_profile.dart';
import 'package:todo/view/main_screens/profileScreen/profile_items_screens/favorites.dart';
import 'package:todo/view/main_screens/profileScreen/profile_items_screens/settings.dart';

class Database {
  static const List profileDataList = [
    {
      'label': 'Edit profile',
      'icon': Icon(
        Icons.edit_note_sharp,
        color: Colors.black,
      )
    },
    {
      'label': 'Favorites',
      'icon': Icon(
        Icons.favorite,
        color: Colors.black,
      )
    },
    {
      'label': 'Settings',
      'icon': Icon(
        Icons.settings,
        color: Colors.black,
      )
    },
    {
      'label': 'Delete all data',
      'icon': Icon(
        Icons.delete_sweep_sharp,
        color: Colors.black,
      )
    },
    {
      'label': 'About us',
      'icon': Icon(
        Icons.emoji_people,
        color: Colors.black,
      )
    },
  ];

  static List<Widget> ProfileScreenList = [
    EditProfile(),
    Favorites(),
    Settings(),
    Deletealldata(),
    Aboutus()
  ];

  static const List<Map> deleteScreenDatas = [
    {
      'title': '● Permanent Deletion',
      'message':
          'This action will permanently delete all your tasks and data stored in the application. Once deleted, this information cannot be restored. Make sure you have saved any important tasks or notes elsewhere before proceeding.'
    },
    {
      'title': '● Irreversible Action',
      'message':
          'Deleting all data is an irreversible action. This means that once you proceed, there is no way to undo the deletion or recover your tasks. Please double-check your to-do list and confirm if this is what you want to do.'
    },
    {
      'title': '● Loss of All Tasks',
      'message':
          'By deleting all data, you will lose every task, including completed, pending, and archived items. This action will clear your entire to-do list, removing all records of your tasks and goals. This cannot be undone.'
    },
    {
      'title': '● No Recovery',
      'message':
          'There is no way to recover your tasks or any other data once you delete it. Make sure you have backed up any important information before proceeding with this action. Deleting all data will result in complete and permanent loss of your task history.'
    },
    {
      'title': '● Confirmation Required',
      'message':
          'You are about to perform a critical action that will permanently erase all data from your to-do list. Please carefully consider your decision. Confirm that you wish to proceed with deleting all data, as this action cannot be undone.'
    },
  ];

  static const List<Map> aboutUsList = [
    {
      'title': 'About Me',
      'subtitle':
          'Welcome to our To-Do Application, a simple and efficient tool designed to help you manage your tasks effortlessly. This app was developed as part of a learning journey in Flutter development, showcasing the skills and passion for creating user-friendly applications.'
    },
    {
      'title': 'Developer',
      'subtitle':
          'This application was created by Sujith, a Flutter developer intern at Luminar Technolab. It serves as a hands-on project to explore the possibilities of Flutter and enhance skills in mobile app development. The primary goal of this app is to demonstrate the core functionalities of a to-do list, including adding, editing, and deleting tasks.'
    },
    {
      'title': 'Purpose',
      'subtitle':
          'This app is a learning project aimed at improving development skills and understanding the nuances of app design and functionality. While it may be a simple tool, it represents the dedication and effort put into mastering Flutter development.'
    },
  ];

  static const List<Map> dropDownButtonItemList = [
    {
      'label': 'Work',
      'value': 'Work',
      'icon': Icon(
        Icons.sports_gymnastics_outlined,
        color: Colors.black,
      )
    },
    {
      'label': 'Personal',
      'value': 'Personal',
      'icon': Icon(
        Icons.person,
        color: Colors.black,
      )
    },
    {
      'label': 'Shopping',
      'value': 'Shopping',
      'icon': Icon(
        Icons.shopping_cart,
        color: Colors.black,
      )
    },
    {
      'label': 'Fitness & Health',
      'value': 'Fitness & Health',
      'icon': Icon(
        Icons.fitness_center,
        color: Colors.black,
      )
    },
    {
      'label': 'Home',
      'value': 'Home',
      'icon': Icon(
        Icons.home_work_rounded,
        color: Colors.black,
      )
    },
    {
      'label': 'Study',
      'value': 'Study',
      'icon': Icon(
        Icons.school,
        color: Colors.black,
      )
    },
    {
      'label': 'Finance',
      'value': 'Finance',
      'icon': Icon(
        Icons.local_atm_outlined,
        color: Colors.black,
      )
    },
    {
      'label': 'Errands',
      'value': 'Errands',
      'icon': Icon(
        Icons.tsunami_sharp,
        color: Colors.black,
      )
    },
    {
      'label': 'Events',
      'value': 'Events',
      'icon': Icon(
        Icons.event_available_outlined,
        color: Colors.black,
      )
    },
    {
      'label': 'Travel',
      'value': 'Travel',
      'icon': Icon(
        Icons.travel_explore,
        color: Colors.black,
      )
    },
  ];

  static const List<Map> tasksList = [
    {
      'taskName': 'Task Name',
      'time': '',
      'icon': Icon(
        Icons.category_rounded,
        color: Colors.white,
      ),
      'label': 'Catagory'
    }
  ];
}
