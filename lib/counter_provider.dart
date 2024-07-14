import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int x = 0;
  String value = "X";
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
  List temp = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  late String cpuChoice;
  String winner = "";

  playerMove(pos, choice) {
    int element = pos + 1;
    temp.remove("$element");
    print("player move temp $temp");
    data[pos] = choice;
    isDisabled[pos] = true;
    print("player move $isDisabled");
    notifyListeners();
    return checkWinners(choice);
  }

  cpuMove(cpuChoice, choice) {
    if (temp.isNotEmpty) {
      temp.shuffle();
      print("temp after shuffle$temp");
      int cpuPos = int.parse(temp[0]);
      print(cpuPos);
      isDisabled[cpuPos - 1] = true;
      print("player move disabled $isDisabled");
      temp.removeAt(0);
      print("After remove temp $temp");
      data[cpuPos - 1] = cpuChoice;
    }
    notifyListeners();
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
        notifyListeners();
        return "wins";
      }
    }
    print("Draw");
    notifyListeners();
    for (bool i in isDisabled) {
      if (i == false) {
        return "";
      }
    }
    winner = "Draw";
    return "Draw";
  }

  void reset(choice) {
    value = choice;
    data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    isDisabled = List.filled(9, false);
    temp = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
    winner = "";
  }
}
