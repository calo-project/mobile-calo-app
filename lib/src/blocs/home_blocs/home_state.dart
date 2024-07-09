part of '../bloc.dart';

@immutable
abstract class HomeState {}

class HomeDataLoaded extends HomeState {
  HomeDataLoaded({required this.selectedIndex});

  final int selectedIndex;
}
