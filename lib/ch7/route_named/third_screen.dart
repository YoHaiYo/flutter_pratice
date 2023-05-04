import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThirdScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text("PopUntil"),
          ),
          ElevatedButton(
            onPressed: () {
              /// 화면이동하고 기존의 페이지들 전부 삭제
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false,);
            },
            child: Text("pushNamedAndRemoveUnitl"),
          ),
        ],
      ),
    );
  }
}