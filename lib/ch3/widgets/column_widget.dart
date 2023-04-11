import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// Column : 세로로 위젯들을 쌓는 위젯
    /// Column에서 main은 세로(기준축) -> 가능한 세로 사이즈로 최대화
    /// Coulumn 에서 cross는 가로(교차축) -> 자식 위젯의 사이즈만큼만

    // SizeBox = Container에서 width, height, child 특성만 빼온 위젯
    // size만 지정가능
    return SizedBox(
      width: double.infinity,
      // height: 400,


      child: Column(
        //위젯 하나만 넣으면 child, 여러개 넣으면 children
        children: [
          // Color(0xffHexCode) : HexCode로 색칠하기
          _conainer(100, 100, Color(0xff347534)),
          _conainer(100, 100, Colors.orange),
          _conainer(100, 100, Colors.blue),

        ],

        // 세로축에 있는 위젯들을 정렬하는 거
        // 자식 위젯들이 세로(기준)축으로 어떻게 위치할지 설정
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        // 자식 위젯들이 가로축에 어떻게 위치할지 설정
        crossAxisAlignment: CrossAxisAlignment.stretch,

        // 세로(기준)축의 최소/최대 사이즈 설정
        mainAxisSize: MainAxisSize.max,

        // VerticalDirection.up 하면 상하 반전됨.
        verticalDirection: VerticalDirection.down,

      ),
    );
  }

  /// 위젯을 리턴하는 함수
  // 기존의 함수는 return 타입 void, String

Widget _conainer(
    double width,
    double height,
    Color color,
    ){
    return Container(
      width: width,
      height: height,
      color: color,
    );
}
}
