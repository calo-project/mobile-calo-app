part of '../bloc.dart';

@immutable
abstract class HomeEvent {}

class SetHomeState extends HomeEvent {
  SetHomeState([this.state]);

  final HomeState? state;
}

class SetHomeSelectedIndex extends HomeEvent {
  SetHomeSelectedIndex({required this.index});

  final int index;
}
