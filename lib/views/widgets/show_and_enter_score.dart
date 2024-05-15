import 'package:flutter/material.dart';

class ShowAndEnterScore extends StatelessWidget {
  const ShowAndEnterScore({
    super.key,
    required this.color,
    required this.player,
    required this.score,
    required this.increaseScore,
    required this.changeValue,
    required this.controller,
  });

  final Color color;
  final String player;
  final String score;
  final void Function()? increaseScore;
  final void Function(String)? changeValue;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            player,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            score,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          // Image(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              controller: controller,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "score",
              ),
              onChanged: changeValue,
            ),
          ),
          ElevatedButton(
            onPressed: increaseScore,
            child: Text("Enter"),
          ),
        ],
      ),
    );
  }
}
