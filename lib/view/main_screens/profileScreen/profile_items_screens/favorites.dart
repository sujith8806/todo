import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
       backgroundColor: Colors.white,
      title: Text('Favorites',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.white,);
  }
}