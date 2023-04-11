import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded
          (flex: 2,
          child: _conainer(100, 200, Colors.amberAccent,0),),
        // Expanded : 정해진 영역 내에서 크기를 최대화 한다.
        const Spacer(flex: 1,),
        _conainer(100, 100, Colors.cyanAccent,0),

        // Spacer() : 빈공간만들기
        // flex : 비율
        const Spacer(flex: 1,),
        _conainer(100, 100, Colors.brown,0),

      ],
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //mainAxisSize: MainAxisSize.min : 기본 가로100+100+100으로 최소값만드니까 안움직이게됨.
      mainAxisSize: MainAxisSize.max,
    );
  }

      Widget _conainer(double width, double height, Color color,double radius){
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
