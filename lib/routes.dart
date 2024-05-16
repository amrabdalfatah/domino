import 'package:domino/views/final_result_view.dart';
import 'package:domino/views/register_view.dart';
import 'package:domino/views/score_view.dart';
import 'package:domino/views/splash_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.home: (context) => SplashView(),
  AppRoutes.register: (context) => RegisterView(),
  AppRoutes.score: (context) => ScoreScreen(),
  AppRoutes.result: (context) => FinalResultView(),
};

class AppRoutes {
  static const String home = "/";
  static const String register = "/register";
  static const String score = "/score";
  static const String result = "/result";
}
