import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/home_page/view/home_screen.dart';
import 'tools/theme/theme_bloc/bloc/theme_bloc.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: ((context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const HomeScreen(),
            theme: ThemeData(
                brightness:
                    state is DarkTheme ? Brightness.dark : Brightness.light),
          );
        })));
  }
}
