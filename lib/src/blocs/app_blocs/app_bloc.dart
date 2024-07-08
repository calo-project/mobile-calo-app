part of '../bloc.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(true));

  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield AppState(event.showNavBar);
  }
}
