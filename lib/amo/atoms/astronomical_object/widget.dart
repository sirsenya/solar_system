import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solar_system/db.dart';

/// The Sun and planets are astronomical objects

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
  /// Position of an astronomical object
  double left = 0;
  double top = 0;

  /// stop timer to stop animation / start timer to start animation
  bool timerIsOn = false;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  /// Arbitrary value to decrease size of all astronomical objects
  /// since they are related to the screen size
  static double decreaseSizes = 50;

  ///size of an astronomical object depends on the size of the screen
  double astronomicalObjectSize(double size) =>
      (size * min(screenWidth, screenHeight)) / decreaseSizes;

  ///size of the sun
  double get sunSize => astronomicalObjectSize(sizeOfSun);
  ///size of current astronomical object
  double get thisAstronomicalObjectSize => astronomicalObjectSize(widget.size);

  void animation() {
    setState(() {
      timerIsOn = true;
    });
    /// the slowest speed (less the delay - higher the speed)
    const int maxTimerDelay = 50;
    int timerDelay = (maxTimerDelay / widget.speed).floor();
    /// current position
    double objectPosition = 0;
    ///circle formula
    double s = 2 * pi / 180;

    Timer.periodic(Duration(milliseconds: timerDelay), (timer) {

      /// The bigger the planet the smaller its maxRadius(so that the planet
      /// doesn't fly away from the screen) and also the bigger its minRadius (
      /// so that it doesn't collide into the sun)

      /// max radius is smallest screen dimension divided by 2 (since its a radius and not a diameter)
      /// and minus the radius of a planet, so that half of the planet
      /// doesn't fly away from the screen
      double maxRadius = (min(screenWidth, screenHeight) / 2 - thisAstronomicalObjectSize / 2);
      /// same logic here, I add radius of a planet to minRadius, so that a half of the planet
      /// doesn't collide into the sun;
      double minRadius = (sunSize / 2 + thisAstronomicalObjectSize / 2);
      /// since our MenuSlider (from MenuScreen() ) has 10 conditional units
      /// we divide possible radius to 10;
      double radiusUnit = (maxRadius - minRadius) / 10;
      /// if radius is 0 then it's the Sun;
      double radius =
          widget.radius == 0 ? 0 :
          (minRadius + (radiusUnit * widget.radius));
      double offset = (thisAstronomicalObjectSize / 2);
      objectPosition += widget.clockWise ? s : -s;
      setState(() {
        left = screenWidth / 2 - offset - radius * cos(objectPosition);
        top = screenHeight / 2 - offset - radius * sin(objectPosition);
      });
      if (timerIsOn == false) timer.cancel();
    });
  }

  ///for future development
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
        width: thisAstronomicalObjectSize,
        height: thisAstronomicalObjectSize,
      ),
    );
  }
}
