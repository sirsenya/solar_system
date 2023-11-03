import 'package:flutter/material.dart';
import 'package:solar_system/bloc/planets/planets_bloc.dart';
import '../menu/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanetSystemScreen extends StatefulWidget {
  const PlanetSystemScreen({super.key});


  @override
  State<PlanetSystemScreen> createState() => _PlanetSystemScreenState();
}
///Starting page of the app - shows existing planets.

class _PlanetSystemScreenState extends State<PlanetSystemScreen> {
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
                /// Planets and the star from the Bloc
            return Stack(
              children: state.astronomicalObjects,
            );
          }),
        ),
      ),

      /// Go to the MenuScreen where a user can add new planets

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MenuScreen(),
          ),
        ),
        tooltip: 'Меню',
        child: const Icon(Icons.arrow_forward_ios),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
