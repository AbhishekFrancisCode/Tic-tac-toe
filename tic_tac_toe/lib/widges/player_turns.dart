import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/game_page/bloc/x_o_bloc.dart';

class PlayerTurn extends StatelessWidget {
  final bool isXTurn;
  const PlayerTurn({Key? key, required this.isXTurn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            BlocBuilder<XOBloc, XOState>(
              builder: (context, state) {
                if (state.isXTurn) {
                  return Image.asset(
                    "assets/images/x.png",
                    width: 30,
                  );
                } else {
                  return Image.asset(
                    "assets/images/o.png",
                    width: 30,
                  );
                }
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Turn',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
