import 'package:flutter/material.dart';

/// A title for a slider/switcher from menu screen

class MenuTitle extends StatelessWidget {
  final String title;
  const MenuTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(color: Colors.black87),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
