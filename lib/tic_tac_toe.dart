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
import 'package:provider/provider.dart';
import 'package:tictac_toe/counter_provider.dart';
import 'package:tictac_toe/home_screen.dart';
import 'package:tictac_toe/screen_changer.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({
    super.key,
    required this.choice,
    /* required this.onTapFunction*/
  });
  final String choice;
  /*final Function onTapFunction;*/

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<CounterProvider>(context);
    (widget.choice == "X") ? obj.cpuChoice = "0" : obj.cpuChoice = "X";
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
                    onTap: (!obj.isDisabled[index])
                        ? () {
                            print("Button Tapped ${obj.data[index]}");
                            if (obj.data[index] != "X" &&
                                obj.data[index] != "0") {
                              String res = obj.playerMove(index, widget.choice);
                              if (res == "wins") {
                                return;
                              }
                              obj.cpuMove(obj.cpuChoice, widget.choice);
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
                        obj.data[index],
                        style: TextStyle(fontSize: 30),
                      ),
                    ));
              },
            ),
          ),
          Text(
            "Result : ${obj.winner}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          ElevatedButton(
              onPressed: () {
                obj.reset(widget.choice);
                print(obj.value);
                Navigator.pop(context);
              },
              child: Text("RESTART", style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
