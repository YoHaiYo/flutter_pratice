// import 'package:lecture_230304/ch1/variable.dart';
import 'package:flutter/material.dart';

import 'gpt_test/bulletin_board.dart';
import 'gpt_test/cal.dart';
import 'gpt_test/clothespage.dart';
import 'gpt_test/market.dart';
import 'home_screen.dart';

// main, runApp은 플로터의 약속임. 건들이면 문제생겨요~
// main함수 : 앱을 실행하면 가장 먼저 실행되는 함수.
void main() {

  // runApp : 앱을 실행 시키기 위해서 호출하는 함수
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}