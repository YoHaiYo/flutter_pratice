/// 강사님이 작성한 코드랑 비교해서 따라해보기 !!

import 'package:flutter/material.dart';

class UIExam1 extends StatefulWidget {
  const UIExam1({Key? key}) : super(key: key);

  @override
  State<UIExam1> createState() => _UIExam1State();
}

class _UIExam1State extends State<UIExam1> {

  final PageController pageController = PageController(
    viewportFraction: 0.9,
  );

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {});


    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("복잡한 UI"),
      ), body: Column(
      children: [
        ///ㅡㅡㅡㅡㅡ 상단
        /// 택시 첫줄
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  _image_texi_1(),
                  Text("택시")
                ],
              ),
              Column(
                children: [
                  _image_texi_1(),
                  Text("블랙")
                ],
              ),
              Column(
                children: [
                  _image_texi_1(),
                  Text("바이크")
                ],
              ),
              Column(
                children: [
                  _image_texi_1(),
                  Text("대리")
                ],
              ),
            ],
          ),
        ),
        /// 택시 둘째줄
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  _image_texi_1(),
                  Text("택시")
                ],
              ),
              Column(
                children: [
                  _image_texi_1(),
                  Text("블랙")
                ],
              ),
              Column(
                children: [
                  _image_texi_1(),
                  Text("바이크")
                ],
              ),
              Column(
                children: [
                  _image_blank(),
                  Text("")
                ],
              ),
            ],
          ),
        ),

        ///ㅡㅡㅡㅡㅡ 중단
        Container(
          height: 150,
          child: Expanded(child: pageViewWidget()),
        ),

        ///ㅡㅡㅡㅡㅡ 하단
        Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.notifications_none),
                SizedBox(width: 10,),
                Text("[이벤트] 이것은 공지사항입니다"),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.notifications_none),
                SizedBox(width: 10,),
                Text("[이벤트] 이것은 공지사항입니다"),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.notifications_none),
                SizedBox(width: 10,),
                Text("[이벤트] 이것은 공지사항입니다"),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.notifications_none),
                SizedBox(width: 10,),
                Text("[이벤트] 이것은 공지사항입니다"),
              ],
            ),

          ],
        )
      ],


    ),
    );
  }

  // ㅡㅡㅡㅡ 위젯 ㅡㅡㅡㅡ

  Widget _image_texi_1() {
    return Container(
      width: 50,
      height: 50,
      child: Image.asset(
        "assets/texi1.png",
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }
  Widget _image_blank() {
    return Container(
      width: 50,
      height: 50,
      child: Image.asset(
        "assets/blank.png",
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }
  Widget _image_road_1() {
    return Container(
      width: 150,
      height: 50,
      child: Image.asset(
        "assets/road1.jpg",
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
      ),
    );
  }
  Widget _image_road_2() {
    return Container(
      width: 150,
      height: 50,
      child: Image.asset(
        "assets/road2.jpg",
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
      ),
    );
  }
  Widget _image_road_3() {
    return Container(
      width: 150,
      height: 50,
      child: Image.asset(
        "assets/road3.jpg",
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
      ),
    );
  }

  Widget pageViewWidget() {
    return PageView(
      controller: pageController,

      // reverse: true,

      // scrollDirection: Axis.vertical,

      pageSnapping: true,

      onPageChanged: (value) {
        print('value : $value');
      },

      children: [
        _image_road_1(),
        _image_road_2(),
        _image_road_3(),

      ],


    );
  }


}
