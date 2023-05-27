import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slack"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Stack 위젯에서 나중에 입력될수록 위로 쌓인다.
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
          /// Positioned : 해당 좌표 위젯을 위치시킨다.
          Positioned(
            top: 150,
            left: 100,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
          Positioned(
            bottom: 100,
            right: 100,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          Text(
            'Stack Example',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),


    );
  }
}
