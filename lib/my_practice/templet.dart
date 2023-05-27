import 'package:flutter/material.dart';

class Templet extends StatefulWidget {
  const Templet({Key? key}) : super(key: key);

  @override
  State<Templet> createState() => _TempletState();
}

class _TempletState extends State<Templet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Templet"),
      ),

    );
  }
}
