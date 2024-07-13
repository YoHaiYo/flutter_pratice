import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({Key? key}) : super(key: key);

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldScreen"),
      ),
      body: Column(
        children: [
          /// TextField : 그냥 입력 밑줄만
          TextField(),
          SizedBox(height: 50,),

          /// 입력밑줄 + 힌트텍스트
          TextField(
            decoration: InputDecoration(
              labelText: "여기에 입력하세요",
            ),
          ),
          SizedBox(height: 50,),

          /// OutlineInputBorder : 테두리
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "여기에 입력하세요",
            ),
          )
        ],
      ),

    );
  }
}
