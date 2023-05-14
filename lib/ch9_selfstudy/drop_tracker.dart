import 'package:flutter/material.dart';

class DropTracker extends StatefulWidget {
  const DropTracker({Key? key}) : super(key: key);

  @override
  State<DropTracker> createState() => _DropTrackerState();
}

class _DropTrackerState extends State<DropTracker> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    final showDraggable = color == Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text("DropTracker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// DragTarget : 말그대로 드래그를 받을 목표물.
            /// DragTarget 내부에 builder 구분은 잘 모르겠다.
            DragTarget<Color>(
              /// onAccept: 드래그 드롭했을때 발생하는 이벤트 정의
              /// 여기서는 드래그한 블록의 색으로 color를 업데이트함 (data를 받아옴)
              onAccept: (data) => setState(() => color = data),
              builder: (context, _, __) => Container(
                /// 상단에서 정의한 color 받아옴.
                color: color,
                width: 200,
                height: 200,
              ),
            ),
            /// IgnorePointer : 이벤트 무시할떄 사용
            IgnorePointer(
              /// ignoring : 히트박스 테스트 중 이 위젯을 무시할지 여부.
              /// ignoring : true : 이벤트 무시. 그래서 박스자체가 드래그가 안됨.
              /// ignoring : false : 이벤트 정상작동. 근데 원래있던 박스에 이벤트가 계속됨. 허공클릭해도 주황박스나옴.
              // ignoring: false,

              /// ignoring: !showDraggable : 이렇게하면 이벤트 지속안됨. !는 논리부정연산자
              /// bool타입의 showDraggable 함수를 부정한것을 무시한다. 즉, 보이는걸 부정한것을 무시하니까 안보이게 되는것.
              ignoring: !showDraggable,
              child: Opacity(
                /// opacity: 투명도 정의.
                /// opacity: showDraggable ? 1:1 : showDraggable가 true 이면 투명도 1, false이면 0 이라는 뜻.
                /// 즉, 평상시 투명도 100퍼, 드래그 완료하고 나선 투명도 0퍼
                opacity: showDraggable ? 1:0,
                child: Draggable<Color>(
                  /// data에서 드롭되고 바뀔 색 정의
                  data: Colors.blueAccent,
                  child: Container(
                    color: Colors.green,
                    width: 200,
                    height: 200,
                  ),

                  /// feedback: 드래그 되면 보여줄 위젯 !
                  feedback: Container(
                    color: Colors.orange,
                    width: 200,
                    height: 200,
                  ),

                  /// childWhenDragging: 드래그 하고나서 원래 있던 위젯을 바꾸고 싶을때 쓴다
                  childWhenDragging: Container(
                    color: Colors.red,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
