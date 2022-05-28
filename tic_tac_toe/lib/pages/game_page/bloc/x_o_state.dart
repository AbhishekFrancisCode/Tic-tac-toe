part of 'x_o_bloc.dart';

@immutable
abstract class XOState {
  const XOState(this.data, this.isXTurn);
  final List<List<String>> data;
  final bool isXTurn;

  // @override
  // List<Object> get props => [data, isXTurn];
}

class XOInitialState extends XOState {
  final int xWin;
  final int oWin;
  final int draw;

  const XOInitialState(
      {required List<List<String>> data,
      required this.xWin,
      required this.oWin,
      required this.draw,
      required bool isXTurn})
      : super(data, isXTurn);
  @override
  String toString() => 'XOInitialState(xWin: $xWin, oWin: $oWin, draw: $draw)';

  // @override
  // List<Object> get props => [data, xWin, oWin, draw, isXTurn];
}

class XOGameBoardChanged extends XOState {
  const XOGameBoardChanged(List<List<String>> data, bool isXTurn)
      : super(data, isXTurn);
}

class XOGameOver extends XOState {
  final int xWins;
  final int oWins;
  final int draws;
  final String winner;

  const XOGameOver(
      {required List<List<String>> data,
      required this.xWins,
      required this.oWins,
      required this.draws,
      required this.winner,
      required bool isXTurn})
      : super(data, isXTurn);
  // @override
  // List<Object> get props => [data, xWin, oWin, draws, winner, isXTurn];
  @override
  String toString() {
    return 'GameOver(winner: $winner, xWin: $xWins, oWin: $oWins, drawss: $draws)';
  }
}
