import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/app_sessions.dart';
import 'package:todo/view/initial_setup_screens/get_Started_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  var box = await Hive.openBox(AppSessions.TodoData);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: GetStartedScreen());
  }
}
