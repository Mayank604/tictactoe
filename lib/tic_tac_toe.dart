// import 'package:flutter/material.dart';
// import 'dart:io';

// class TicTacToe extends StatefulWidget {
//   const TicTacToe({super.key, required this.choice});
//   final String choice;

//   @override
//   State<TicTacToe> createState() => _TicTacToeState();
// }

// class _TicTacToeState extends State<TicTacToe> {
//   List data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
//   //List board = List.generate(9, (int index) => index + 1);
//   // List temp = [...board];
//   late List temp;

//   List WinningCases = [
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8],
//     [0, 3, 6],
//     [1, 4, 7],
//     [2, 5, 8],
//     [0, 4, 8],
//     [2, 4, 6]
//   ];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     temp = List.of(data);
//   }

// //   playerTurn(choice,int pos)
// //   {
// //     temp.remove(pos);
// //     data[pos-1]=choice;
// //     return checkwinners(choice);
// // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.games),
//           title: Text("Tic Tac Toe"),
//         ),
//         body: Column(
//           children: [
//             Text(
//               "YOUR CHOICE IS : ${widget.choice}",
//               style: TextStyle(fontSize: 25),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height / 2,
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 children: [
//                   ...data.map((el) {
//                     return InkWell(
//                       onTap: () {
//                         print("Button Tapped");
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Text(
//                           el,
//                           style: TextStyle(fontSize: 30),
//                         ),
//                         decoration: ShapeDecoration(
//                           color: const Color.fromARGB(255, 240, 227, 187),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                   Text(
//                     "Result : ",
//                     style: TextStyle(fontSize: 30),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:tictac_toe/home_screen.dart';
import 'package:tictac_toe/screen_changer.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe(
      {super.key, required this.choice, required this.onTapFunction});
  final String choice;
  final Function onTapFunction;

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List isDisabled = List.filled(9, false);

  List winningCases = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  late List temp;
  late String cpuChoice;
  String winner = "";
  @override
  void initState() {
    // TODO: implement initState
    temp = List.of(data);
    (widget.choice == "X") ? cpuChoice = "0" : cpuChoice = "X";
    super.initState();
  }

  playerMove(pos) {
    setState(() {
      int element = pos + 1;
      temp.remove("$element");
      print(temp);
      data[pos] = widget.choice;
    });
    return checkWinners(widget.choice);
  }

  cpuMove(cpuChoice) {
    setState(() {
      if (temp.isNotEmpty) {
        temp.shuffle();
        int cpuPos = int.parse(temp[0]);
        isDisabled[cpuPos - 1] = true;
        print(temp);
        temp.removeAt(0);
        print(temp);
        data[cpuPos - 1] = cpuChoice;
      }
    });
    return checkWinners(cpuChoice);
  }

  checkWinners(choice) {
    for (List wins in winningCases) {
      if (data[wins[0]] == choice &&
          data[wins[1]] == choice &&
          data[wins[2]] == choice) {
        print("$choice is Winner");
        winner = "$choice ";
        isDisabled = List.filled(9, true);
        return "$choice wins";
      }
    }
    print("Draw");
    return "Draw";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.games),
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        children: [
          Text(
            "YOUR CHOICE IS : ${widget.choice}",
            style: TextStyle(fontSize: 25),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (!isDisabled[index])
                        ? () {
                            print("Button Tapped ${data[index]}");

                            if (data[index] != "X" && data[index] != "0") {
                              String res = playerMove(index);
                              if (res == "wins") {
                                return;
                              }
                              // if(widget.choice=="X"){
                              //   cpuMove("0");
                              // }else{
                              //   cpuMove("X");
                              // }
                              cpuMove(cpuChoice);
                              isDisabled[index] = true;
                            }
                          }
                        : () {},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(255, 240, 227, 187),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      child: Text(
                        data[index],
                        style: TextStyle(fontSize: 30),
                      ),
                    ));
              },
            ),
          ),
          Text(
            "Result : $winner",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          ElevatedButton(
              onPressed: () {
                //screenChange();
                widget.onTapFunction("home");
                Navigator.pop(context);
              },
              child: Text("RESTART", style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
