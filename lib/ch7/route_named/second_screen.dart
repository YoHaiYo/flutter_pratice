import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  String name = " ";
  int age = 0;
  double weight = 0;

  @override
  void initState() {
    super.initState();
  }

  /// BuildContext : 특정 위젯의 주소, build 함수에 완성됨
  /// initState는 build 함수보다 먼저호출됨. 그래서 context 함수 사용불가.
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    /// args 의 타입(형태)가 Map<String, dynamic> 과 같은지 체크.
    if(args is Map<String, dynamic>){
      name = args["name"];
      age = args["age"];
      weight = args["weight"];
    }

    print("args : $args");

    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: Column(
        children: [
          Text("이름 : $name"),
          Text("나이: $age"),
          Text("몸무게 : $weight"),

          ///이걸로 출력하면 {}안에 정의된 args값이 출력됩니다.
          // Text(args.toString(), style: TextStyle(fontSize: 20),),

          ElevatedButton(
            onPressed: () {

              List<String> data = [
                "안녕하세요~",
                "잘부탁해요.",
                "저도요.",
              ];

              Navigator.pop(context, data);
            },
            child: Text("Pop"),
          ),
          /// pushNamed 는 단순히 1,2열리고 3이 열리는거라서 3페이지에서 뒤로가기하면 2로 간다.
          ElevatedButton(
            onPressed: () {
              /// main.dart - routes 에서 지정한 페이지로 이동
              Navigator.pushNamed(context, "/third");
            },
            child: Text("Go Third"),
          ),
          /// pushReplacementNamed 는 아예 페이지가 바뀌는거임. 그래서 3페이지에서 뒤로가기하면 바로 1로 간다.
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/third");
              },
              child: Text("Go Third Replace")),

        ],
      ),
    );
  }
}