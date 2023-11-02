part of 'planets_bloc.dart';

@immutable
abstract class PlanetsEvent {}

class PlanetsAddEvent {
  final AstronomicalObject astronomicalObject;
  PlanetsAddEvent({required this.astronomicalObject});
}
