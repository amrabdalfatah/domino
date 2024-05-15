import 'package:domino/views/widgets/show_and_enter_score.dart';
import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({
    super.key,
    required this.playerOne,
    required this.playerTwo,
    required this.endGame,
  });

  final String playerOne;
  final String playerTwo;
  final int endGame;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late int playerOneScore;
  late int playerTwoScore;
  late int playerOneIncrease;
  late int playerTwoIncrease;
  late TextEditingController controller1;
  late TextEditingController controller2;

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
                    player: widget.playerTwo,
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
                    player: widget.playerOne,
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
