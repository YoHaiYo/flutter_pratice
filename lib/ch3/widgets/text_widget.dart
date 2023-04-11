import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Center : 영역을 최대로 확장시킨구에 자식위젯은 최대로 키운다.
    return Center(
      child: Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,
        width: 300,
        height: 300,
        child: Text(
            "TEXT",
          style: TextStyle(
            fontSize: 35,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            //letterSpacing : 자간 크기
            letterSpacing: 4,
            height: 1.5,
            // backgroundColor: Colors.grey.shade500,
            // shadows: [
            //   Shadow(color: Colors.black54,
            //       offset: Offset(5,5),
            //       blurRadius: 8,
            //   ),
            // ],
            //
            // decoration: TextDecoration.lineThrough,
            // decorationThickness: 1,
            // decorationColor: Colors.black54,
            // decorationStyle: TextDecorationStyle.solid,

          ),
          // maxLines : 최대 몇줄까지 보여주는지
          maxLines: 3,
          // overflow : ... 으로 내용 생략

          //TextOverflow.fade는 softWrap 특성을 false로 설정해야 동작
          softWrap: true,
          overflow: TextOverflow.fade,

          // 텍스트 크기 비율을 설정
          textScaleFactor: 1.5,
          textWidthBasis: TextWidthBasis.longestLine,

          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),


        ),
      ),
    );
  }
}
