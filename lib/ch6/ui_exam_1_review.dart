import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lecture_230304/ch6/widgets/ch6_widgets.dart';

import '../ch4/scaffold_widget.dart';
import '../ch5/single_scroll_screen.dart';

class UIExam1Review extends StatefulWidget {
  const UIExam1Review({Key? key}) : super(key: key);

  @override
  State<UIExam1Review> createState() => _UIExam1ReviewState();
}

class _UIExam1ReviewState extends State<UIExam1Review> {

  final Ch6Widgets ch6widgets = Ch6Widgets();


  /// viewport : 화면에 보이는 영역
  final PageController pageController = PageController(viewportFraction: 0.9);

  List<String> imageList = [
    "assets/road1.jpg",
    "assets/road2.jpg",
    "assets/road3.jpg",
  ];

  int _currentIndex = 0;

  /// dispose : controller가 화면 나갈때 꺼져야함. 안그러면 메모리 문제생김.
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ch6widgets.appBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ch6widgets.body(pageController, imageList),
          Container(
            color: Colors.deepOrange,
          ),
          Container(color: Colors.green,),
        ],
      ),
      bottomNavigationBar: _NaviBar(),
    );
    /// 강사님은 appBar를 _appbar 함수로 빼서 썼음. 나중에 효율성 확인해보기
  }

  Widget _NaviBar() {
    return BottomNavigationBar(
      /// currentIndex : 처음에 몇번째 네비바가 선택될지 고름.
        currentIndex: _currentIndex,
        onTap: (value) {
          /// setState : 화면을 다시 그리라는 명령
          setState(() {
            _currentIndex = value;
          });
          debugPrint(value.toString());
        },

        /// 선택됬을때 / 안됬을때 라벨 보여주기/ 안보여주기
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 20,
        // elevation: 150,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
        /// selectedItemColor : 텍스트랑 아이콘 동시 변경
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        items: [
          /// 선택 안 됐을때
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,
            ),

            /// 선택 됐을때
            activeIcon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: "이용서비스",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: "내정보",
          ),
        ]);
  }

  /// 페이지 이동 만들기

}
