import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({Key? key}) : super(key: key);

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

/// 버튼 종류
// 1. ElevatedButton
// 2. TextButton
// 3. OutlinedButton
// 4. IconButton

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonScreen 연습"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _elvatedButton(),
            const SizedBox(height: 60,),
            _textButton(),
            const SizedBox(height: 60,),
            _oulinedButton(),
            const SizedBox(height: 30,),
            _iconButton(),
          ],
        ),
      ),
    );
  }

  Widget _elvatedButton() {
    // MediaQuery : 반응형 버튼임. 늘리거나 줄이면 따라서 늘어남. 강사님 git보기
    return ElevatedButton(
      // onPressed : 누르면 활성화
      onPressed: () {
        print("onPressed");
      },

      // onLongPress : 길게 눌렀을때 활성화
      onLongPress: () {
        print("onLongPress");
      },
      // onHover : 마우스 올려놨을때 활성화 (웹에서만됨)
      onHover: (value) {
        print("onHover : $value");
      },

      // onPressed: null,

      style: buttonStyle(),

      child: Text("ElevatedButton"),
    );
  }

  Widget _textButton(){
    return TextButton(
        onPressed: (){},
        style: buttonStyle(),
        child: Text("textButton"),
    );
  }

  Widget _oulinedButton(){
    return TextButton(
      onPressed: (){},
      style: buttonStyle(),
      child: Text("oulinedButton"),
    );
  }

  Widget _iconButton(){
    return IconButton(
        onPressed: (){},
        icon: Icon(Icons.add),
      iconSize: 40,
      color: Colors.green,
      // highlightColor : 버튼눌렀을때 배경 컬러
      highlightColor: Colors.blue.withOpacity(0.5),
      // splashColor : 버튼눌렀을때 물결 퍼지는 컬러
      splashColor: Colors.purple,
      splashRadius: 30,
      focusColor: Colors.pinkAccent,
      // mouseCursor : 버튼에 마우스올렸을때 마우스 모양
      mouseCursor: SystemMouseCursors.grabbing,
      // hoverColor : 마우스 올렸을때 색깔
      hoverColor: Colors.red.shade500,
      // 아이콘 사이즈, 클릭 영역 증가
      constraints: const BoxConstraints(minHeight: 70, minWidth: 70),
      // tooltip : 마우스 올리면 설명나오게 하기
      tooltip: "아이콘 버튼",

    );
  }

  ButtonStyle buttonStyle() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ElevatedButton.styleFrom(
      // backgroundColor : 버튼의 컬러
      backgroundColor: Colors.orange,
      // foregroundColor : 텍스트의 컬러와 눌렀을때 splash 컬러 변경
      foregroundColor: Colors.black,

      shadowColor: Colors.black,
      elevation: 8,

      // Size 클래스는 2개의 값을 넣을 수 있음.
      // 첫번째는 가로(width), 두번째는 세로(height)
      fixedSize: Size(width * 0.8, height * 0.1),
      // fixedSize: Size(100, 400),
      // minimumSize: const Size(200, 60),
      // maximumSize: const Size(600,150),

      // 버튼 내부를 패딩
      padding: EdgeInsets.only(bottom: 30),

      alignment: Alignment.bottomCenter,

      // disabled : 버튼 비활성시키기. 여기선 onPressed: null 넣으면됨.
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.white,
      //disabledMouseCursor : 비활성화 됬을때 마우스 커서 바뀜.
      disabledMouseCursor: SystemMouseCursors.basic,
      enabledMouseCursor: SystemMouseCursors.grab,

      // 버튼 형태 출력
      shape: _shape(type: OutlinedBorderType.stadiumBorder),
    );
  }

  OutlinedBorder _shape({required OutlinedBorderType type}) {
    var borderSide = const BorderSide(
      color: Colors.blueAccent,
      width: 2,
      // strokeAlign : 테두리가 떠있는 형태
      strokeAlign: 10,
    );
    var borderRadius = BorderRadius.circular(24);

    switch (type) {
      /// 테두리가 둥근형태
      case OutlinedBorderType.roundedRectangleBorder:
        return RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide,
        );

      /// 원형, 타원형 형태
      case OutlinedBorderType.circleBorder:
        return CircleBorder(
          side: borderSide,
          // eccentricity = 1 : 원이 사각형의 네 면에 닿는 형태
          // eccentricity = 0 : 가장 가까운 두변에 닿는 원을 그린다.
          eccentricity: 1,
        );

      /// 직선 면과 둥근 모서리가 사이가 부드럽고 연속적으로 전환되는 테두리
      case OutlinedBorderType.continuousRetangleBorder:
        return ContinuousRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide,
        );
        break;

      /// 모서리가 각진 형태
      case OutlinedBorderType.beveledRectangleBorder:
        return BeveledRectangleBorder(
          side: borderSide,
          borderRadius: borderRadius,
        );
        break;

      /// 긴쪽의 테두리가 항상 반원인 형태
      case OutlinedBorderType.stadiumBorder:
        return StadiumBorder(
          side: borderSide,
        );
        break;
    }

    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(26),
      side: BorderSide(width: 3, color: Colors.blueAccent),
    );
  }
}

enum OutlinedBorderType {
  roundedRectangleBorder,
  circleBorder,
  continuousRetangleBorder,
  beveledRectangleBorder,
  stadiumBorder,
}
