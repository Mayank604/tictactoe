import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac_toe/counter_provider.dart';

import 'home_screen.dart';
import 'tic_tac_toe.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
            create: (_) => CounterProvider()),
      ],
      child: const MaterialApp(
        //theme: ThemeData.dark(),
        home: HomeScreen(),
      )));
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tictac_toe/counter_provider.dart';
// import 'package:tictac_toe/home_screen.dart';

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()),
//     ],
//     child: MaterialApp(
//       theme: ThemeData.dark(),
//       home: HomeScreen(),
//     ),
//   ));
// }