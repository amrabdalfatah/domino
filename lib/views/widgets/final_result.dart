import 'package:flutter/material.dart';

class FinalResult extends StatelessWidget {
  final String finalScore;
  final String name;
  final String image;
  final Color bkText;

  const FinalResult({
    super.key,
    required this.finalScore,
    required this.name,
    required this.image,
    required this.bkText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            finalScore,
            style: TextStyle(
              backgroundColor: bkText,
            ),
          ),
          Text(
            name,
          ),
          Image.asset(
            image,
          ),
        ],
      ),
    );
  }
}
