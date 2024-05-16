import 'dart:async';

import 'package:domino/views/register_view.dart';
import 'package:domino/views/widgets/final_result.dart';
import 'package:flutter/material.dart';

class FinalResultView extends StatefulWidget {
  const FinalResultView({super.key});

  @override
  State<FinalResultView> createState() => _FinalResultViewState();
}

class _FinalResultViewState extends State<FinalResultView> {
  late final Map parameters;
  String? playerOne;
  String? playerTwo;
  int? endGame;
  int? playerOneScore;
  int? playerTwoScore;

  @override
  void initState() {
    super.initState();
    // dynamicValue();
  }

  void dynamicValue() {
    Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        setState(() {
          timer.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return RegisterView();
              },
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    parameters = ModalRoute.of(context)!.settings.arguments as Map;
    playerOne = parameters['playerOne'];
    playerTwo = parameters['playerTwo'];
    playerOneScore = parameters['playerOneScore'];
    playerTwoScore = parameters['playerTwoScore'];
    endGame = parameters['endGame'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: FinalResult(
                  finalScore: playerOneScore.toString(),
                  name: playerOne!,
                  image: "assets/images/player.gif",
                  bkText:
                      playerOneScore! >= endGame! ? Colors.green : Colors.white,
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: FinalResult(
                  finalScore: playerTwoScore.toString(),
                  name: playerTwo!,
                  image: "assets/images/player.gif",
                  bkText:
                      playerTwoScore! >= endGame! ? Colors.green : Colors.white,
                ),
              ),
            ],
          ),
          Image.network(
            height: 200,
            "https://image.similarpng.com/very-thumbnail/2020/08/Medal-of-winner-design-vector-PNG.png",
          ),
        ],
      ),
    );
  }
}
