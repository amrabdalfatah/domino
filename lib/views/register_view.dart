import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var playerTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "اختر العدد الافصي لنهايه اللعبه",
          ),
          DropdownButton(
            value: "Select Value",
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
              print(val); // setState();
            },
          ),
          CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
              "https://e7.pngegg.com/pngimages/501/617/png-clipart-graphics-drawing-cartoon-cartoon-business-person-hand-photography-thumbnail.png",
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Player 1",
                  ),
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
                    print(val);
                  },
                  onSubmitted: (val) {
                    print("Sumbitted Clicked $val");
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              print(playerTwoController.text);
            },
            child: Text("Enter"),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Reset"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Display"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
