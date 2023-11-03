import 'package:flutter/material.dart';
import 'package:solar_system/amo/atoms/menu_title/widget.dart';

class MenuSwitcherSetting extends StatelessWidget {
  final bool clockWise;
  final void Function(bool) changeOrbitDirection;

  const MenuSwitcherSetting({
    Key? key,
    required this.clockWise,
    required this.changeOrbitDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuTitle(title: "По часовой"),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Switch(value: clockWise, onChanged: changeOrbitDirection,),
        ),
      ],
    );
  }
}
