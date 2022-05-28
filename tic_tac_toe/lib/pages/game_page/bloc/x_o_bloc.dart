import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

part 'x_o_event.dart';
part 'x_o_state.dart';

class XOBloc extends Bloc<XOEvent, XOState> {
  XOBloc()
      : super(const XOInitialState(data: [
          ["", "", ""],
          ["", "", ""],
          ["", "", ""]
        ], xWin: 0, oWin: 0, draw: 0, isXTurn: true)) {
    List<List<String>> boardArray = List<List<String>>.generate(
        3, (index) => List<String>.generate(3, (_) => ""));

    //initialize game state
    bool isXTurn = true;

    int scoreX = 0;
    int scoreO = 0;
    int draw = 0;
    int move = 0;

    on<XOGameInitilizeEvent>((event, emit) {
      isXTurn = (scoreX + scoreO + draw) % 2 == 0;
      move = 0;
      boardArray = List<List<String>>.generate(
          3, (index) => List<String>.generate(3, (_) => ""));
      emit(XOInitialState(
        data: boardArray,
        xWin: scoreX,
        oWin: scoreO,
        draw: draw,
        isXTurn: isXTurn,
      ));
    });

    on<XOTapEvent>((event, emit) {
      if (boardArray[event.x][event.y] == "") {
        move++;
        boardArray[event.x][event.y] = isXTurn ? "x" : "o";
        isXTurn = !isXTurn;
        String winner = checkWinnerOrDraw(boardArray, move);
        if (winner.isNotEmpty) {
          if (winner == 'x') {
            scoreX++;
          } else if (winner == 'o') {
            scoreO++;
          } else if (winner == "draw") {
            draw++;
          }
          HapticFeedback.heavyImpact();
          emit(XOGameOver(
              data: boardArray,
              winner: winner,
              xWins: scoreX,
              oWins: scoreO,
              draws: draw,
              isXTurn: isXTurn));
        } else {
          HapticFeedback.lightImpact();
          emit(XOGameBoardChanged(boardArray, isXTurn));
        }
      }
    });
  }
  @override
  void onTransition(Transition<XOEvent, XOState> transition) {
    if (kDebugMode) {
      print(transition);
    }
    super.onTransition(transition);
  }

  String checkWinnerOrDraw(List<List<String>> boardArray, int moves) {
    String winner = "";
    for (int i = 0; i < 3; i++) {
      if (boardArray[i][0] == "x" &&
          boardArray[i][1] == "x" &&
          boardArray[i][2] == "x") {
        winner = "x";
        break;
      } else if (boardArray[i][0] == "o" &&
          boardArray[i][1] == "o" &&
          boardArray[i][2] == "o") {
        winner = "o";
        break;
      } else if (boardArray[0][i] == "x" &&
          boardArray[1][i] == "x" &&
          boardArray[2][i] == "x") {
        winner = "x";
        break;
      } else if (boardArray[0][i] == "o" &&
          boardArray[1][i] == "o" &&
          boardArray[2][i] == "o") {
        winner = "o";
        break;
      }
    }

    if ((boardArray[0][0] == "x" &&
            boardArray[1][1] == "x" &&
            boardArray[2][2] == "x") ||
        (boardArray[0][2] == "x" &&
            boardArray[1][1] == "x" &&
            boardArray[2][0] == "x")) {
      winner = "x";
    } else if ((boardArray[0][0] == "o" &&
            boardArray[1][1] == "o" &&
            boardArray[2][2] == "o") ||
        (boardArray[0][2] == "o" &&
            boardArray[1][1] == "o" &&
            boardArray[2][0] == "o")) {
      winner = "o";
    }

    if (moves == 9) {
      winner = "draw";
    }
    return winner;
  }
}
