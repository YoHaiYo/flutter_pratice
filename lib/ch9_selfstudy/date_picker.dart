import 'package:flutter/material.dart';

class DialogEtcScreen extends StatefulWidget {
  const DialogEtcScreen({Key? key}) : super(key: key);

  @override
  State<DialogEtcScreen> createState() => _DialogEtcScreenState();
}

class _DialogEtcScreenState extends State<DialogEtcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogEtcScreen"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: onPressed, child: Text("show Diaglog"))
          ],
        ),
      ),

    );
  }

}
