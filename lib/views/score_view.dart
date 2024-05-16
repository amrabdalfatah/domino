import 'package:domino/routes.dart';
import 'package:domino/views/widgets/show_and_enter_score.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late Map parameters;
  late int playerOneScore;
  late int playerTwoScore;
  late int playerOneIncrease;
  late int playerTwoIncrease;
  late TextEditingController controller1;
  late TextEditingController controller2;
  int? endGame;
  String? playerOne;
  String? playerTwo;

  @override
  void initState() {
    super.initState();
    playerOneScore = 0;
    playerTwoScore = 0;
    playerOneIncrease = 0;
    playerTwoIncrease = 0;
    controller1 = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    parameters = ModalRoute.of(context)!.settings.arguments as Map;
    endGame = parameters['endGame'];
    playerOne = parameters['playerOne'];
    playerTwo = parameters['playerTwo'];
    if (playerOneScore >= endGame! || playerTwoScore >= endGame!) {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.result,
        arguments: {
          "playerOne": playerOne,
          "playerTwo": playerTwo,
          "endGame": endGame,
          "playerOneScore": playerOneScore,
          "playerTwoScore": playerTwoScore,
        },
      );
    }
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: ShowAndEnterScore(
                    controller: controller2,
                    color: Colors.yellow,
                    player: playerTwo!,
                    score: "$playerTwoScore",
                    changeValue: (val) {
                      try {
                        playerTwoIncrease = int.parse(val);
                      } catch (e) {
                        playerTwoIncrease = 0;
                      }
                      setState(() {});
                    },
                    increaseScore: playerTwoIncrease != 0
                        ? () {
                            playerTwoScore += playerTwoIncrease;
                            playerTwoIncrease = 0;
                            controller2.clear();
                            setState(() {});
                          }
                        : null,
                  ),
                ),
                Container(
                  height: 300,
                  width: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.white,
                ),
                Expanded(
                  child: ShowAndEnterScore(
                    controller: controller1,
                    color: Colors.green,
                    player: playerOne!,
                    score: "$playerOneScore",
                    changeValue: (val) {
                      try {
                        playerOneIncrease = int.parse(val);
                      } catch (e) {
                        playerOneIncrease = 0;
                      }
                      setState(() {});
                    },
                    increaseScore: playerOneIncrease != 0
                        ? () {
                            playerOneScore += playerOneIncrease;
                            playerOneIncrease = 0;
                            controller1.clear();
                            setState(() {});
                          }
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Display"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Reset"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
}
