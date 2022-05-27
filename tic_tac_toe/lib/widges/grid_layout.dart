import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/x_o_bloc.dart';
import 'tile.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<XOBloc, XOState>(builder: ((context, state) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Tile(
                          x: 0,
                          y: 0,
                          value: state.data[0][0],
                        ),
                        Tile(
                          x: 0,
                          y: 1,
                          value: state.data[0][1],
                        ),
                        Tile(
                          x: 0,
                          y: 2,
                          value: state.data[0][2],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Tile(
                          x: 1,
                          y: 0,
                          value: state.data[1][0],
                        ),
                        Tile(
                          x: 1,
                          y: 1,
                          value: state.data[1][1],
                        ),
                        Tile(
                          x: 1,
                          y: 2,
                          value: state.data[1][2],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Tile(
                          x: 2,
                          y: 0,
                          value: state.data[2][0],
                        ),
                        Tile(
                          x: 2,
                          y: 1,
                          value: state.data[2][1],
                        ),
                        Tile(
                          x: 2,
                          y: 2,
                          value: state.data[2][2],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
