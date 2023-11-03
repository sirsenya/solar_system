import 'package:flutter/material.dart';

import '../../../db.dart';

class PickColorDropdownButton extends StatelessWidget {
  final String value;
  final void Function(dynamic) changePlanetColor;

  const PickColorDropdownButton({
    Key? key,
    required this.value,
    required this.changePlanetColor,
  }) : super(key: key);

  /// create dropdown color options
  List<DropdownMenuItem> dropdownItems() {
    List<DropdownMenuItem> dropdownItems = [];
    for (int i = 0; i < colors.length; i++) {
      String value = colors.keys.elementAt(i);
      dropdownItems.add(
        DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      );
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black87,
      child: DropdownButton(
          dropdownColor: Colors.black87,
          focusColor: Colors.white24,
          style: TextStyle(color: Colors.white, fontSize: 20),
          value: value,
          items: dropdownItems(),
          onChanged: changePlanetColor),
    );
  }
}
