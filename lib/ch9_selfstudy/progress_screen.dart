import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressScreen"),
      ),
      body: Center(
        child: Column(
          children: [

            /// Progress 위젯은 로딩창 용도로 사용되며, 다음과 같이 두종류가 있다.

            SizedBox(height: 50,),
            Text("CircularProgressIndicator"),
            CircularProgressIndicator(),
            SizedBox(height: 50,),
            Text("LinearProgressIndicator"),
            LinearProgressIndicator(),
          ],
        ),
      ),

    );
  }
}
