import 'package:flutter/material.dart';

import 'amo/atoms/astronomical_object/widget.dart';

/// a fake db
//TODO:-connect to a real db

const double sizeOfSun = 10;

List<AstronomicalObject> astronomicalObjectsDB = [
  /// the sun
  const AstronomicalObject(
    color: Colors.yellow,
    radius: 0,
    speed: 1,
    size: sizeOfSun,
  ),
  const AstronomicalObject(
    radius: 7,
    speed: 10,
    size: 3,
    clockWise: false,
    color: Colors.blue,
  ),
  const AstronomicalObject(
    radius: 10,
    speed: 1,
    size: 5,
    color: Colors.grey,
  ),
  const AstronomicalObject(
    radius: 1,
    clockWise: false,
    speed: 3,
    size: 5,
    color: Colors.green,
  ),
];

Map<String, Color> colors = {
  "красный": Colors.red,
  "зелёный": Colors.green,
  "жёлтый": Colors.yellow,
  "голубой": Colors.blue,
  "коричневый": Colors.brown,
  "оранжевый": Colors.orange,
};