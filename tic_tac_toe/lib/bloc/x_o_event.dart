part of 'x_o_bloc.dart';

abstract class XOEvent {}

class XOGameInitilizeEvent extends XOEvent {
  // @override
  // List<Object?> get props => [];
}

class XOTapEvent extends XOEvent {
  final int x;
  final int y;
  XOTapEvent(this.x, this.y);

  // @override
  // List<Object> get props => [x, y];
  @override
  String toString() => 'XOTapEvent(x: $x, y: $y)';
}
