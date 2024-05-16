import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController playerOneController;
  late TextEditingController playerTwoController;
  late String numberEnd;

  @override
  void initState() {
    super.initState();
    playerOneController = TextEditingController();
    playerTwoController = TextEditingController();
    numberEnd = 'Select Value';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 100),
              const Text(
                "اختر العدد الاقصي لنهايه اللعبه",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: DropdownButton(
                  value: numberEnd,
                  items: const [
                    DropdownMenuItem(
                      value: "Select Value",
                      child: Text(
                        "Select Value",
                      ),
                    ),
                    DropdownMenuItem(
                      value: "101",
                      child: Text(
                        "101",
                      ),
                    ),
                    DropdownMenuItem(
                      value: "151",
                      child: Text(
                        "151",
                      ),
                    ),
                  ],
                  onChanged: (String? val) {
                    setState(() {
                      numberEnd = val!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    "https://e7.pngegg.com/pngimages/501/617/png-clipart-graphics-drawing-cartoon-cartoon-business-person-hand-photography-thumbnail.png",
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: playerOneController,
                      decoration: InputDecoration(
                        hintText: "Player 1",
                      ),
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      controller: playerTwoController,
                      decoration: InputDecoration(
                        hintText: "Player 2",
                      ),
                      onChanged: (val) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: numberEnd != "Select Value" &&
                          playerOneController.text.isNotEmpty &&
                          playerTwoController.text.isNotEmpty
                      ? () {
                          // Navigator.of(context).pushReplacement(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ScoreScreen(
                          //         playerOne: playerOneController.text,
                          //         playerTwo: playerTwoController.text,
                          //         endGame: int.parse(numberEnd),
                          //       );
                          //     },
                          //   ),
                          // );
                          Navigator.of(context).pushNamed(
                            "/score",
                            arguments: {
                              "playerOne": playerOneController.text,
                              "playerTwo": playerTwoController.text,
                              "endGame": int.parse(numberEnd),
                            },
                          );
                        }
                      : null,
                  child: Text("Enter"),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // todo: When connected with data base and restore play.
                    },
                    child: Text("Display"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      print("Reset Button");
                      print(numberEnd);
                      print(playerOneController.text);
                      print(playerTwoController.text);
                      playerOneController.clear();
                      playerTwoController.clear();
                      numberEnd = "Select Value";
                      setState(() {});
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    playerOneController.dispose();
    playerTwoController.dispose();
    super.dispose();
  }
}
