import 'package:flutter/material.dart';
import 'package:solar_system/pages/menu/widget.dart';
import 'package:solar_system/pages/planet_system/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/planets/planets_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlanetsBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PlanetSystem(),
      ),
    );
  }
}
