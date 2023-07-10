import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  int index = 0;
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    on<BottomNavigationBarEvent>((event, emit) {
      if (event is IndexChangeEvent) {
        emit(IndexChangedState(index: event.index));
      }
    });
  }
}
