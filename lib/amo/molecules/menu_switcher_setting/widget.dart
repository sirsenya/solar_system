import 'package:flutter/material.dart';

class MenuSwitcherSetting extends StatefulWidget {
  const MenuSwitcherSetting({Key? key}) : super(key: key);

  @override
  State<MenuSwitcherSetting> createState() => _MenuSwitcherSettingState();
}

class _MenuSwitcherSettingState extends State<MenuSwitcherSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("По часовой"),
        Switch(value: false, onChanged: (_) {}),
        Text("Против часовой"),
      ],
    );
  }
}
