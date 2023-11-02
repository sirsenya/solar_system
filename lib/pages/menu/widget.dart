import 'package:flutter/material.dart';
import 'package:solar_system/amo/atoms/astronomical_object/widget.dart';
import 'package:solar_system/amo/atoms/pick_color_dropdown_button/widget.dart';
import 'package:solar_system/amo/molecules/menu_switcher_setting/widget.dart';
import 'package:solar_system/bloc/planets/planets_bloc.dart';
import 'package:solar_system/pages/planet_system/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../amo/molecules/menu_slider_setting/widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  double _planetSize = 1;

  void changePlanetSize(double planetSize) => setState(() {
        _planetSize = planetSize;
      });
  double _orbitRadius = 1;

  void changeOrbitRadius(double orbitRadius) => setState(() {
        _orbitRadius = orbitRadius;
      });
  Color _planetColor = Colors.red;

  void changePlanetColor(Color planetColor) => setState(() {
        _planetColor = planetColor;
      });
  bool _clockWise = true;

  void changeOrbitDirection(bool clockWise) => setState(() {
        _clockWise = clockWise;
      });

  AstronomicalObject addPlanet() {
    double size = _planetSize / 2;
    double radius = _orbitRadius;
    return AstronomicalObject(
      radius: radius,
      speed: 20,
      size: size,
      color: Colors.orange,
      clockWise: false,
    );
  }

/*  const AstronomicalObject(
  radius: 2.05,
  clockWise: false,
  speed: 30,
  size: 50,
  color: Colors.green,

    const AstronomicalObject(
    radius: 9,
    speed: 30,
    size: 50,
    color: Colors.grey,
  ),

  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PlanetSystem(),
          ),
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/space_2.jpeg'), fit: BoxFit.fill),
          color: Colors.black,
        ),
        child: Column(
          children: [
            MenuSliderSetting(
              title: "Размер планеты",
              value: _planetSize,
              changeValue: changePlanetSize,
            ),
            MenuSliderSetting(
              title: "Радиус орбиты",
              value: _orbitRadius,
              changeValue: changeOrbitRadius,
            ),
            MenuSwitcherSetting(),
            PickColorDropdownButton(),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PlanetsBloc>(context).add(
                    PlanetsAddEvent(
                      astronomicalObject: addPlanet(),
                    ),
                  );
                },
                child: Text("Добавить планету"))
          ],
        ),
      ),
    );
  }
}
