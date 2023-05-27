import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardScreen"),
      ),
      body: Center(
        /// Card : 카드형태를 만드는 위젯.
        /// Card 위젯과 Container 위젯의 차이 : 
        /// Card는 디자인적 요소가 많아서 디자인용도로 쓰이고, Container는 위치지정, 레이아웃 용으로 쓰인다.
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 4.0,
              child: Container(
                width: 200,
                height: 200,
                child: Center(child: Text("This is Card Widget")),
              ),
            ),
          ],
        ),
    ),

    );
  }
}
