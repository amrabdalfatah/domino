import 'dart:async';

import 'package:domino/views/register_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  int valueLinear = 0;
  @override
  void initState() {
    super.initState();
    dynamicValue();
  }

  void dynamicValue() {
    Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        setState(() {
          if (valueLinear == 100) {
            timer.cancel();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return RegisterView();
                },
              ),
            );
          } else {
            valueLinear++;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrKRskhZI35Xwu29ZYHqPw4dEY_7zTs0g0c9G2LKSg3A&s",
                height: 300,
                width: 200,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "${valueLinear}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            LinearProgressIndicator(
              value: valueLinear / 100, // 0 - 1
              color: Colors.green,
              minHeight: 16,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "لعب الدومينو ممتع لكن لا تقضي كل وقتك عليها لا تنسي عباده الله",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
