import 'package:flutter/material.dart';
import 'package:solar_system/amo/atoms/menu_title/widget.dart';

/// A slider to change speed, size and orbit of a planet

class MenuSliderSetting extends StatelessWidget {
  final String title;
  final double value;
  final Function(double value) changeValue;

  const MenuSliderSetting({
    Key? key,
    required this.title,
    required this.value,
    required this.changeValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuTitle(title: title),
        Slider(
            value: value,
           // divisions: 9,
            min: 1,
            max: 10,
            onChanged: changeValue),
      ],
    );
  }
}
