import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tools/style.dart';
import '../../../tools/theme/theme_bloc/bloc/theme_bloc.dart';
import '../../game_page/view/tictactoe_page.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(builder: ((context, state) {
            return IconButton(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(state is! DarkTheme));
                },
                icon: state is DarkTheme
                    ? const Icon(Icons.light_mode, color: Colors.orange)
                    : const Icon(Icons.dark_mode, color: Colors.black));
          }))
        ],
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) {
          return HomeBloc();
        },
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ShowOptionDailogState) {
              showDialog(
                  context: context,
                  builder: (dailogContext) {
                    return BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: const AlertDialog(),
                    );
                  });
            } else if (state is ShowJoinGameDailogState) {
              showDialog(
                  context: context,
                  builder: (dailogContext) {
                    return const AlertDialog();
                  });
            } else if (state is ShowCreatingGameDailogState) {
              showDialog(
                  context: context,
                  builder: (dailogContext) {
                    return const AlertDialog();
                  });
            }
          },
          child: const HomeView(),
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: textButtonStyle,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TicTacToe()));
          },
          child: Text("Start Game",
              style: Theme.of(context).textTheme.headline6?.boldText),
        )

        // ElevatedButton(
        //     onPressed: () {
        //       BlocProvider.of<HomeScreenBloc>(context)
        //           .add(ShowOptionDailogEvent());
        //     },
        //     child: const Text("Play in Room")),
      ],
    ));
  }
}
