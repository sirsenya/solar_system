import 'package:flutter/material.dart';

class MenuTitle extends StatelessWidget {
  final String title;
  const MenuTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(color: Colors.black87),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
