import 'package:flutter/material.dart';

class PracticeWidget extends StatelessWidget {
  const PracticeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _container(100, 50, Colors.blue),
              _container(100, 50, Colors.orange),
              _container(100, 50, Colors.yellowAccent),
            ],
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _container(100, 100, Colors.cyanAccent),
            ],
          ))
        ],

      ),
    );
  }

  Widget _container(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}