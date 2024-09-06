import 'package:flutter/material.dart';

class Tilelist extends StatelessWidget {
  Tilelist({super.key, required this.label, required this.tileIcon});
  String label;
  Icon tileIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: tileIcon,
      title: Text(label),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
    );
  }
}
