import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/game_page/bloc/x_o_bloc.dart';

class PointsTablle extends StatelessWidget {
  const PointsTablle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<XOBloc, XOState>(buildWhen: ((previous, current) {
      return current is XOGameOver || current is XOInitialState;
    }), builder: ((context, state) {
      int xWins = 0;
      int oWins = 0;
      int draw = 0;
      if (state is XOInitialState) {
        xWins = state.xWin;
        oWins = state.oWin;
        draw = state.draw;
      } else if (state is XOGameOver) {
        xWins = state.xWins;
        oWins = state.oWins;
        draw = state.draws;
      }
      if (state is XOInitialState || state is XOGameOver) {
        Color? colors = Colors.white;
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                color: colors,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/x.png",
                        width: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        xWins.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Card(
                color: colors,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/o.png",
                        width: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        oWins.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Card(
                color: colors,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/draw.png",
                        width: 40,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        draw.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}
