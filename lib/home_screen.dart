// import 'package:flutter/material.dart';
// import 'package:tictac_toe/tic_tac_toe.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key /*, required this.onTapFunction*/});
//   //final Function onTapFunction;
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String value = "X";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.games_rounded,
//               size: 200,
//             ),
//             const Text(
//               "TIC TAC TOE",
//               style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Select Choice = > "),
//                 DropdownButton(
//                     value: value,
//                     items: const [
//                       DropdownMenuItem(value: "0", child: Text("0")),
//                       DropdownMenuItem(value: "X", child: Text("X"))
//                     ],
//                     onChanged: (val) {
//                       setState(() {
//                         value = val!;
//                       });
//                     }),
//               ],
//             ),
//             OutlinedButton(
//                 onPressed: () {
//                   //widget.onTapFunction(value);
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => TicTacToe(choice: value)));
//                 },
//                 child: const Text(
//                   "Start Game",
//                   style: TextStyle(fontSize: 25, color: Colors.black87),
//                 ))
//           ],
//         )),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac_toe/tic_tac_toe.dart';

import 'counter_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String value = "X";
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.games_rounded,
              size: 200,
            ),
            const Text(
              "TIC TAC TOE",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Select Choice = > "),
                DropdownButton(
                    value: obj.value,
                    items: const [
                      DropdownMenuItem(value: "0", child: Text("0")),
                      DropdownMenuItem(value: "X", child: Text("X"))
                    ],
                    onChanged: (val) {
                      setState(() {
                        obj.value = val!;
                      });
                    }),
              ],
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TicTacToe(choice: obj.value)));
                },
                child: const Text(
                  "Start Game",
                  style: TextStyle(fontSize: 25, color: Colors.black87),
                ))
          ],
        )),
      ),
    );
  }
}
