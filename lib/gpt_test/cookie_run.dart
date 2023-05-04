import 'package:flutter/material.dart';

void main() => runApp(CookieRunApp());

class CookieRunApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Run',
      home: CookieRun(),
    );
  }
}

class CookieRun extends StatefulWidget {
  @override
  _CookieRunState createState() => _CookieRunState();
}

class _CookieRunState extends State<CookieRun> {
  double _position = 0;
  double _velocity = 0;
  double _gravity = 1;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    _position = 0;
    _velocity = 0;
    _gravity = 1;
  }

  void jump() {
    setState(() {
      _velocity = -20;
    });
  }

  void updatePhysics() {
    setState(() {
      _velocity += _gravity;
      _position += _velocity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      bottom: _position,
      child: GestureDetector(
        onTap: jump,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class Obstacle extends StatelessWidget {
  final Size screenSize;
  final Size obstacleSize;
  final Offset obstaclePosition;

  const Obstacle({
    Key? key,
    required this.screenSize,
    required this.obstacleSize,
    required this.obstaclePosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: obstaclePosition.dx,
      bottom: obstaclePosition.dy,
      child: Container(
        width: obstacleSize.width,
        height: obstacleSize.height,
        color: Colors.green,
      ),
    );
  }
}
