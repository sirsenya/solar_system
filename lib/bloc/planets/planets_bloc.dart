import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:solar_system/db.dart';

import '../../amo/atoms/astronomical_object/widget.dart';

part 'planets_event.dart';
part 'planets_state.dart';

class PlanetsBloc extends Bloc<PlanetsAddEvent, PlanetsLoadedState> {
  PlanetsBloc() : super(PlanetsLoadedState(astronomicalObjects: astronomicalObjectsDB)) {
    on<PlanetsAddEvent>((event, emit) {
    state.astronomicalObjects.add(event.astronomicalObject);
        emit(PlanetsLoadedState(astronomicalObjects: state.astronomicalObjects));
    });
  }
}
