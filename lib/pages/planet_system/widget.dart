import 'package:flutter/material.dart';
import 'package:solar_system/bloc/planets/planets_bloc.dart';
import '../menu/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetSystem extends StatefulWidget {
  const PlanetSystem({super.key});


  @override
  State<PlanetSystem> createState() => _PlanetSystemState();
}

class _PlanetSystemState extends State<PlanetSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/space.jpeg'),
              fit: BoxFit.fill,
            ),
            color: Colors.black,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: BlocBuilder<PlanetsBloc, PlanetsLoadedState>(
              builder: (context, state) {
            return Stack(
              children: state.astronomicalObjects,
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MenuScreen(),
          ),
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_forward_ios),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
