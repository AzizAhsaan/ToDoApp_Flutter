import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  MyButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.purple[200],
      textColor: Colors.white,
      child: Text(name, style: TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
