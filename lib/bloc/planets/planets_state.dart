part of 'planets_bloc.dart';

@immutable
abstract class PlanetsState {}

class PlanetsLoadedState extends PlanetsState {
  final List<AstronomicalObject> astronomicalObjects;
  PlanetsLoadedState({required this.astronomicalObjects});
}
