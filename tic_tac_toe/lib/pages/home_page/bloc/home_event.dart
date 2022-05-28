part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ShowOptionDailogEvent extends HomeEvent {}

class ShowJoinGameDailogEvent extends HomeEvent {}

class ShowCreatingGameDailogEvent extends HomeEvent {}

class ShowWaitingForPlayerDailogEvent extends HomeEvent {}
