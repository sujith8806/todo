import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  ButtonContainer({
    super.key,
    required this.text,
    required this.onTap,
  });

  String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
