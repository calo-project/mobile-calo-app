part of '../bloc.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_homeDataLoaded) {
    on<SetHomeState>((event, emit) => emit(event.state ?? _homeDataLoaded));

    on<SetHomeSelectedIndex>((event, emit) {
      _selectedIndex = event.index;
      emit(_homeDataLoaded);
    });
  }

  static int _selectedIndex = 0;

  static HomeDataLoaded get _homeDataLoaded => HomeDataLoaded(
        selectedIndex: _selectedIndex,
      );
}
