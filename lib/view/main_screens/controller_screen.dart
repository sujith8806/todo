import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo/view/main_screens/homeScreen/homeScreen.dart';
import 'package:todo/view/main_screens/profileScreen/profile_screen.dart';
import 'package:todo/view/main_screens/taskAddScreen/task_add_screen.dart';

class ControllerScreen extends StatefulWidget {
  ControllerScreen({super.key, this.name});
  final String? name;
  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _bottomBarController =
      NotchBottomBarController(index: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavigationBarTap(int index) {
    _pageController.jumpToPage(index);
    _bottomBarController.index = index;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      Homescreen(),
      TaskAddScreen(),
      ProfileScreen()
    ];
    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        showLabel: true,
        textAlign: TextAlign.center,
        bottomBarHeight: 50,
        notchBottomBarController: _bottomBarController,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem:
                Icon(Icons.maps_home_work_rounded, color: Colors.grey),
            itemLabel: 'Home',
            activeItem: Icon(Icons.maps_home_work_rounded, color: Colors.black),
          ),
          BottomBarItem(
            itemLabel: 'Add Task',
            inActiveItem: Icon(Icons.add, color: Colors.grey),
            activeItem: Icon(Icons.task_alt_outlined, color: Colors.black),
          ),
          BottomBarItem(
            itemLabel: 'Profile',
            inActiveItem: Icon(Icons.person, color: Colors.grey),
            activeItem: Icon(Icons.person, color: Colors.black),
          ),
        ],
        onTap: _onBottomNavigationBarTap,
        kIconSize: 20,
        kBottomRadius: 16,
      ),
      backgroundColor: Colors.white,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: bottomBarPages,
        onPageChanged: (index) {
          _bottomBarController.index = index;
        },
      ),
    );
  }
}
