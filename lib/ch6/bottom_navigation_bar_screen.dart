import 'package:flutter/material.dart';

class BottomNavigationbarScreen extends StatefulWidget {
  const BottomNavigationbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbarScreen> createState() =>
      _BottomNavigationbarScreenState();
}

class _BottomNavigationbarScreenState extends State<BottomNavigationbarScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationbarScreen"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(color: Colors.red,),
          Container(color: Colors.orange,),
          Container(color: Colors.green,),
        ],
      ),
      bottomNavigationBar: _bottom(),
    );
  }

  /// BottomNavigationBar는 기본적으로 item이 3개 이상 필요!
  Widget _bottom() {
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
        showUnselectedLabels: false,
        iconSize: 25,
        // elevation: 150,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        /// selectedItemColor : 텍스트랑 아이콘 동시 변경
        selectedItemColor: Colors.purple,
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
            icon: Icon(Icons.alarm_off),
            activeIcon: Icon(Icons.access_alarm),
            label: "알림",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "친구",
          ),
        ]);
  }
}
