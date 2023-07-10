part of 'bottom_navigation_bar_bloc.dart';

@immutable
abstract class BottomNavigationBarEvent {}

class IndexChangeEvent extends BottomNavigationBarEvent {
  final int index;

  IndexChangeEvent({required this.index});
}
