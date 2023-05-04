import 'package:flutter/material.dart';
import 'package:lecture_230304/ch7/route_named/second_screen.dart';
import 'package:lecture_230304/ch7/route_named/third_screen.dart';

import 'first_screen.dart';

void main() {
  runApp(const RouteNamed());
}

class RouteNamed extends StatelessWidget {
  const RouteNamed({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /// 앱바, 버튼 색 일괄 변경
        primarySwatch: Colors.green,
      ),
      initialRoute: "/",
      routes: {
        // 이동할 페이지들을 경로 형식으로 등록해 놓는 것
        // "/" 해당 텍스트를 쓰면 해당페이지로 이동.
        // Navigator.pushNamed 와 연동해서 쓰는 것
        "/" : (context) => const FirstScreen(),
        "/second" : (context) => const SecondScreen(),
        "/third" : (context) => const ThirdScreen(),
      },
    );
  }
}