import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:solar_system/amo/atoms/astronomical_object/widget.dart';
import 'package:solar_system/amo/atoms/pick_color_dropdown_button/widget.dart';
import 'package:solar_system/amo/molecules/menu_switcher_setting/widget.dart';
import 'package:solar_system/bloc/planets/planets_bloc.dart';
import 'package:solar_system/pages/planet_system/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../amo/molecules/menu_slider_setting/widget.dart';
import '../../db.dart';

/// Screen where user can add new planets or return to the PlanetSystemScreen

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  /// preset for a new planet, changed by the user when (s)he interacts with
  /// the menu
  double _planetSize = 1;
  double _orbitRadius = 1;
  String _planetColor = colors.keys.first;
  bool _clockWise = false;
  double _planetSpeed = 1;

  /// functions for changing presets above
  void changePlanetSize(double planetSize) => setState(() {
        _planetSize = planetSize;
      });

  void changeOrbitRadius(double orbitRadius) => setState(() {
        _orbitRadius = orbitRadius;
      });

  void changePlanetSpeed(double planetSpeed) => setState(() {
        _planetSpeed = planetSpeed;
      });

  void changePlanetColor(dynamic planetColor) => setState(() {
        _planetColor = planetColor;
      });

  void changeOrbitDirection(bool clockWise) => setState(() {
        _clockWise = clockWise;
      });

  /// function that creates new planet
  AstronomicalObject addPlanet() {
    double size = _planetSize / 2;
    double radius = _orbitRadius;
    return AstronomicalObject(
      radius: radius,
      speed: _planetSpeed.floor(),
      size: size,
      color: colors[_planetColor]!,
      clockWise: _clockWise,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/space_2.jpeg'), fit: BoxFit.fill),
          color: Colors.black,
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///changes size of the planet
                MenuSliderSetting(
                  title: "Размер планеты",
                  value: _planetSize,
                  changeValue: changePlanetSize,
                ),

                ///changes orbit's radius
                MenuSliderSetting(
                  title: "Радиус орбиты",
                  value: _orbitRadius,
                  changeValue: changeOrbitRadius,
                ),

                ///changes rotation speed
                MenuSliderSetting(
                  title: "Скорость вращения",
                  value: _planetSpeed,
                  changeValue: changePlanetSpeed,
                ),

                ///changes direction of rotation
                MenuSwitcherSetting(
                  clockWise: _clockWise,
                  changeOrbitDirection: changeOrbitDirection,
                ),

                ///changes planet's color
                PickColorDropdownButton(
                  value: _planetColor,
                  changePlanetColor: changePlanetColor,
                ),

                /// Elevated buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),

                      /// Add new planet
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<PlanetsBloc>(context).add(
                            PlanetsAddEvent(
                              astronomicalObject: addPlanet(),
                            ),
                          );
                        },
                        child: const Text(
                          "Добавить планету",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),

                    /// Go to the PlanetSystemScreen
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        "Вернуться к планетам",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
