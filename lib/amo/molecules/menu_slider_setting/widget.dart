import 'package:flutter/material.dart';
import 'package:solar_system/amo/atoms/menu_title/widget.dart';

class MenuSliderSetting extends StatefulWidget {
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
  State<MenuSliderSetting> createState() => _MenuSliderSettingState();
}

class _MenuSliderSettingState extends State<MenuSliderSetting> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuTitle(title: widget.title),
        Slider(
            value: widget.value,
           // divisions: 9,
            min: 1,
            max: 10,
            onChanged: widget.changeValue),
      ],
    );
  }
}
