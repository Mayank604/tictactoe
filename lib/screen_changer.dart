// import 'package:flutter/material.dart';
// import 'home_screen.dart';
// import 'tic_tac_toe.dart';

// class ScreenChanger extends StatefulWidget {
//   const ScreenChanger({super.key});

//   @override
//   State<ScreenChanger> createState() => _ScreenChangerState();
// }

// class _ScreenChangerState extends State<ScreenChanger> {
//   var currScreen = "home";
//   String playerChoice = "";
//   screenChange(String value) {
//     setState(() {
//       // currScreen = "gameScreen";
//       playerChoice = value;
//       (currScreen == "home") ? currScreen = "gamescreen" : currScreen = "home";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return (currScreen == "home")
//         ? HomeScreen(onTapFunction: screenChange)
//         : TicTacToe(choice: playerChoice, onTapFunction: screenChange);
//   }
// }
