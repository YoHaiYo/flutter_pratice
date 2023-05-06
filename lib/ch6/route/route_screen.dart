import 'package:flutter/material.dart';
import 'package:lecture_230304/ch6/route/route_second.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  String rValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RouteScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RouteSecond(
                message: "안녕하세요",
              );
            },
            )
                /// then : pop -> then : 데이터 가져오기
            ).then((value) {
              setState(() {
                rValue = value;
              });
              /// route_second 에서 데이터 받아온 것 보여주기
              debugPrint("value : $value");
            });
          }, child: Text("Push")),
          Text(rValue)
        ],
      ),
    );
  }
}
