import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  List<String> popData = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            ///
            Map<String, dynamic> data = {
              "name" : "임미나",
              "age" : 17,
              "weight" : 49.3,
            };

            /// main.dart - routes 에서 지정한 페이지로 이동
            /// arguments : 데이터보내기
            /// then : /second 에 있는 data 데이터 가져오기
            /// pushNamed(context, "/second", : /second 페이지로 이동 !
            Navigator.pushNamed(context, "/second", arguments: data,).then((value){

              /// value타입이 List<String>이라면
              /// po[Data 변수에 모두 옮겨 담아라.
              if(value is List<String>){
                /// clear 안하면 계속 누적해서 쌓임
                popData.clear();
                setState(() {
                  popData.addAll(value);
                });
              }

              print('value: $value');
            }

            );
          }, child: Text("Go Second"),
          ),

          // if(popData.isNotEmpty)...[
          //   Text(popData[0]),
          //   Text(popData[1]),
          // ],

          // Text(popData.toString()),

          /// data의 길이가 몇개인지 몰라도 전부 출력시키기.
          for(int i=0; i < popData.length; i++)...[
            Text(popData[i]),
          ],
        ],


      ),
    );
  }
}