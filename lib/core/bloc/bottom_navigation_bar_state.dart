part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarState {}

class BottomNavigationBarInitial extends BottomNavigationBarState {}

class IndexChangedState extends BottomNavigationBarState {
  final int index;

  IndexChangedState({required this.index});
}
