import 'dart:math';

import 'package:flutter/material.dart';

class SingleScrollScreen extends StatefulWidget {
  const SingleScrollScreen({Key? key}) : super(key: key);

  @override
  State<SingleScrollScreen> createState() => _SingleScrollScreenState();
}

class _SingleScrollScreenState extends State<SingleScrollScreen> {

  /// initaSate() : 최초 한번만 호출됨
  /// build 함수는 setState 하면 다시 호출됨
  /// 개발하면서 저장하거나 번개모양(hotReload) 해도 build 호출
  /// 유저 입장에서는 build를 타기위해선 최초 생성되거나
  /// setState함술르 호출해야함

  /// ScrollController : 말 그대로 스크롤이 있는 위젯을 컨트롤 할 수 있다.
  /// 스크롤에 대한 정보를 가지고 있음.
  /// initialScrollOffset: 500 : 처음스크롤 위치를 500으로 시작하게 함.
  final ScrollController scrollController = ScrollController(initialScrollOffset: 500);

  double offset = 0;

  /// 위젯이 생성 될 때 한번만 호출됨.
  @override
  void initState() {
    scrollController.addListener(() {
      /// scrollController.offset : 시작점으로 부터 스크롤된 거리를 픽셀로 보여줌. 0부터시작.
      print('${scrollController.offset}');

      /// 스크롤이 변경 됐을때 setState 함수를 호출해서 화면을 다시 그리도록함.
      /// setState 함수는 Stateful 위젯에서만 존재

      setState(() {
        offset = scrollController.offset;
      });

      /// userScrollDirection 스크롤의 방향 정보
      print('${scrollController.position.userScrollDirection}');

    });
    super.initState();
  }

  /// scrollController는 dispose가 필수임 !
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    /// scrollController가 스크롤 위젯에 연결 됬는지 확인
    /// 최초 build에 진입했을때
    /// 최초 생성시 scrollController.hasClients = false 로 출력
    /// SingleChildScrollView 위젯은 아직 생성 안한 상태기 때문
    /// 그러나 build를 다시 타게 될 경우에는 scrollController.hasClients = true
    scrollController.hasClients;
    print('_SingleScrollScreenState.build : ${scrollController.hasClients}');

    return Scaffold(
        appBar: AppBar(
          title: Text("SingleScrollScreen"),
        ),
        body: SingleChildScrollView(

          controller: scrollController,

          /// 스크롤 상하좌우에 들어가는 패딩
          padding: EdgeInsets.all(30),

          /// reverse: true : 스크롤이 바닥부터 시작함. 카톡 채팅방 같은데서 쓴다.
          /// reverse: false : 스크롤이 처음부터 시작함.
          reverse: false,

          /// scrollDirection: Axis.horizontal : 스크롤이 가로로 바뀜. But 이때 child는 Row로 해야됨.
          // scrollDirection: Axis.horizontal,

          /// keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag
          /// 텍스트 입력할때 스크롤하면 키보드 내려감. 텍스트 입력할때 스크롤하면 입력 텍스트 날라가는거 방지
          /// keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual
          /// 텍스트 입력할때 스크롤해도 키보드 떠있음.
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

          /// primary: true : 아이폰에서 사용가능
          // primary: true,

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(),
              ),

              Text(offset.toString()),

              /// scrollController.jumpTo : 코드로 스크롤 한번에 이동
              ElevatedButton(onPressed: () {
                scrollController.jumpTo(1000);

               }, child: Text("jumpTo")),

              /// scrollController.animateTo : 코드로 스크롤 부드럽게 이동
              ElevatedButton(onPressed: (){
                /// milliseconds : 1000 = 1초
                scrollController.animateTo(2000,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastOutSlowIn);
              }, child: Text("animateTo"),),

              /// ... 기호 : 리스트로 된 변수들을 반환하게 해줌
              ... listItem()

              // item(),
              // item(),
              // item(),
              // item(),
            ],
          ),
        )
    );
  }

  List<Widget> listItem() {
    List<Widget> widgets = [];

    /// int i 의 시작값은 0 ; 10미만까지 반복 ; 1씩 증가
    for (int i = 0; i < 5; i++) {
      widgets.add(item());
    }
    return widgets;
  }

  Widget item() {
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,

      ///랜덤으로 색 넣기 !!!
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],

      // padding : 위젯 내부 간격
      // margin : 위젯 외부 간격
      margin: EdgeInsets.all(10),
    );
  }


}
