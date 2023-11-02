import 'package:flutter/material.dart';

class PickColorDropdownButton extends StatefulWidget {
  const PickColorDropdownButton({Key? key}) : super(key: key);

  @override
  State<PickColorDropdownButton> createState() =>
      _PickColorDropdownButtonState();
}

class _PickColorDropdownButtonState extends State<PickColorDropdownButton> {

  String? _value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _value,
        
        items: [
          DropdownMenuItem(
            value: "red",
            child: Text("Красный"),
            onTap: ()=> setState(() {
              _value = "red";
            }),
          ),
          DropdownMenuItem(
            value: "green",
            child: Text("Зелёный"),
          ),
          DropdownMenuItem(
            value: "yellow",
            child: Text("Жёлтый"),
          ),
          DropdownMenuItem(
            value: "blue",
            child: Text("Голубой"),
          ),
          DropdownMenuItem(
            value: "brown",
            child: Text("Коричневый"),
          ),
          DropdownMenuItem(
            value: "orange",
            child: Text("Оранжевый"),
          ),
        ],
        onChanged: (_) {});
  }
}
