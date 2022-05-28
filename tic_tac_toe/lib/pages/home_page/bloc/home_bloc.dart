import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ShowOptionDailogEvent>((event, emit) {
      emit(ShowOptionDailogState());
    });

    on<ShowJoinGameDailogEvent>((event, emit) {
      emit(ShowJoinGameDailogState());
    });

    on<ShowCreatingGameDailogEvent>((event, emit) {
      createNewGame();
      emit(ShowCreatingGameDailogState());
    });
  }

  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    if (kDebugMode) {
      print(transition);
    }
    super.onTransition(transition);
  }

  void createNewGame() {}
}
