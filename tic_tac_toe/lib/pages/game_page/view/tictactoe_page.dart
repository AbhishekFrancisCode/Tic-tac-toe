import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widges/grid_layout.dart';
import '../../../widges/player_turns.dart';
import '../../../widges/points_table.dart';
import '../bloc/x_o_bloc.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: const Text(
          'TicTacToe',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
              onPressed: () {
                // BlocProvider.of<XOBloc>(context).add(XOGameInitilizeEvent());
              },
              icon: const Icon(Icons.restart_alt, color: Colors.blue)),
        ],
      ),
      body: BlocProvider(
        create: (context) => XOBloc(),
        child: BlocBuilder<XOBloc, XOState>(
          builder: (context, state) {
            // Listen to changes in state.
            return BlocListener<XOBloc, XOState>(
              listener: (context, state) {
                // if game is over then show dailog of winner or draw
                if (state is XOGameOver) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (dailogContext) {
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          title: const Text(
                            "Game Over",
                            style: TextStyle(color: Colors.blue),
                          ),
                          actions: [
                            TextButton.icon(
                              label: const Text(
                                "Replay",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                // on pressing replay add event of [GameInitilize] and pop the dailog.
                                BlocProvider.of<XOBloc>(context)
                                    .add(XOGameInitilizeEvent());
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.restart_alt),
                            ),
                            TextButton(
                              child: const Text("Home"),
                              onPressed: () {
                                // on pressing Home pop dailog and [XO].
                                Navigator.pop(dailogContext);
                                Navigator.pop(context);
                              },
                            )
                          ],
                          content: state.winner != "draw"
                              // if game is not draw then show winner x or O
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    state.winner == "x"
                                        // if X is winner show X on dailog.
                                        ? Image.asset(
                                            "assets/images/x.png",
                                            width: 30,
                                          )
                                        // If O is winner show O on dailog.
                                        : Image.asset(
                                            "assets/images/o.png",
                                            width: 30,
                                          ),
                                    const Text(
                                      "Wins",
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                )
                              //if game is draw show draw.
                              : const Text("Draw"),
                        );
                      });
                }
              },
              child: SafeArea(
                child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      // This will show the number of times x and o wins and number of time they are draw
                      Expanded(flex: 1, child: PointsTablle()),
                      // This is the 3x3 matrix of game
                      Expanded(flex: 3, child: GridLayout()),
                      // This will show whose player turn is it
                      Expanded(
                          flex: 1,
                          child: PlayerTurn(
                            isXTurn: true,
                          )),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
