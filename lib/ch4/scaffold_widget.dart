import 'package:flutter/material.dart';

// stl -> tap

// Scaffold : Flutter MaterialApp에서 최상위 레벨로 고안된 위젯.
// 상위레벨 : 대체적으로 상위 레벨은 위젯이든 클래스든 위쪽에서 먼저 사용하는것.
// 하위레벨 : 나중에 사용하는것.
// Scaffold 위젯을 언제 사용하는가? : 대체적으로 페이지 단위로 사용
// page/screen이란 ? : 화면전체를 의미하기도하고, 화면의 이동단위이기도 하다.

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 상위 레벨은 Scaffold, 하위레벨은 Center(body에 들어오는 위젯)
    return Scaffold(
      // appBar :
      appBar: appBarWidget(),

      // title: Text("Scaffold Widget 연습"),
      // primary: false,

      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(),
            ),
          ],
        ),
      ),
      // primary : 앱바와 같이 사용되는 특성. true, false로 앱바가 달라짐, 상태바의 영역을 사용할지 설정
      // 상태바(statusBar) : 스마트폰의 시간, 배터리 등 표시되는 부분
      // primary: false,
      // extendBodyBehindAppBar: false,
      // 상태바를 제거해야 하는 경우에 이렇게 사용함

      // resizeToAvoidBottomInset : true하면 키보드가 올라왔을때 화면사이즈가 조정됨. 거의 true로 쓴다. 그게 편함.
      resizeToAvoidBottomInset: true,

      persistentFooterAlignment: AlignmentDirectional.center,
      // persistentFooterButtons : 하나의 버튼을 사용할때 주로 사용
      persistentFooterButtons: [
        Container(
          width: double.infinity,
          height: 40,
          color: Colors.cyanAccent,
          child: const Text(
            "이건 하단버튼이에요",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          alignment: Alignment.center,
        ),

        // Container(width: 100, height: 50, color:Colors.blue),
        // Container(width: 100, height: 100, color:Colors.yellow),
        // Container(width: 100, height: 100, color:Colors.white),
      ],
    );
  }

  /// AppBar를 리턴하는 위젯
  ///

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.cyan,
      // eleavation은 z축값이라고 보면됨 : z축이 높으면 그림자가 커짐
      elevation: 5,
      shadowColor: Colors.cyan,

      title: const Text("AppBarWidget 연습"),
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
      // centerTitle을 false 줘야 titleSpacing 조절가능
      titleSpacing: 10,

      // leading : 왼쪽 버튼 넣기. 위젯 하나만 들어감

      leading: Container(
          height: 50,
          width: 50,
          color: Colors.white,
          child: Text(
            "뒤로\n가기",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),

        alignment: Alignment.center,
      ),
      leadingWidth: 50,
      // leading: Icon(Icons.arrow_back_ios,size:30),

      /// 대괄호가 있다는 것은 List의미. 즉, 여러개가 들어간다.
      actions: const [
        Icon(
          Icons.alarm,
          size: 30,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.photo_camera,
          size: 30,
        ),
        SizedBox(width: 10),
        Icon(
          Icons.settings,
          size: 30,
        ),
        SizedBox(width: 10),
      ],
      // 아이콘 색깔 한번에 바꾸기. 그러나 아이콘 각각 주면 각각 준 색깔이 우선임.
      foregroundColor: Colors.black,

      /// toolbarHeight : height 사이즈 조절
      toolbarHeight: 60,

      /// toolbarOpacity : 아이콘 불투명도 (0 ~ 1.00)
      toolbarOpacity: 0.6,
      bottom: AppBar(
        backgroundColor: Colors.blueAccent,
      ),

      // bottomOpacity : 앱 바 하단의 불투명도입니다.  (0 ~ 1.00)
      bottomOpacity: 0.5,
    );
  }
}
