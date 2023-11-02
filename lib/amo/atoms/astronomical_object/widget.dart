import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AstronomicalObject extends StatefulWidget {
  final double radius;
  final int speed;
  final double size;
  final bool clockWise;
  final Color color;

  const AstronomicalObject({
    Key? key,
    required this.radius,
    required this.speed,
    required this.size,
    this.clockWise = true,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  State<AstronomicalObject> createState() => _AstronomicalObjectState();
}

class _AstronomicalObjectState extends State<AstronomicalObject> {
  double left = 0;
  double top = 0;

  bool timerIsOn = false;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  double get size => ( widget.size * min(screenWidth, screenHeight)) / 50;
  double get sunSize => (min(screenWidth, screenHeight) / 5);
  void animation() {
    setState(() {
      timerIsOn = true;
    });

    double f = 0;
    double s = 2 * pi / 180;
    Timer.periodic(Duration(milliseconds: widget.speed), (timer) {
      double maxRadius = (min(screenWidth, screenHeight)/2 - size/2);
      double minRadius = (sunSize/2 + size/2);
      double radiusUnit = (maxRadius - minRadius) /10 ;
      double radius = widget.radius == 0
          ? 0
          : (minRadius + (radiusUnit * widget.radius));
      double offset = (size / 2);
      f += widget.clockWise ? s : -s;
      setState(() {
        left = screenWidth / 2 - offset - radius * cos(f);
        top = screenHeight / 2 - offset - radius * sin(f);
      });
      if (timerIsOn == false) timer.cancel();
    });
  }

  void stopAnimation() {
    setState(() {
      timerIsOn = false;
    });
  }

  @override
  void initState() {
    animation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: widget.color,
        ),
        width: size,
        height: size,
      ),
    );
  }
}
