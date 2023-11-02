import 'package:flutter/material.dart';

import 'amo/atoms/astronomical_object/widget.dart';


List<AstronomicalObject> astronomicalObjectsDB = [
  const AstronomicalObject(
    color: Colors.yellow,
    radius: 0,
    speed: 0,
    size: 10,
  ),
  const AstronomicalObject(
    radius: 1,
    speed: 40,
    size: 1,
    clockWise: false,
    color: Colors.blue,
  ),
  const AstronomicalObject(
    radius: 10,
    speed: 30,
    size: 5,
    color: Colors.grey,
  ),
  const AstronomicalObject(
    radius: 1,
    clockWise: false,
    speed: 30,
    size: 5,
    color: Colors.green,
  ),
];