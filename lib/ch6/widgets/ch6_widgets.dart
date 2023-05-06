import 'dart:math';

import 'package:flutter/material.dart';

class Ch6Widgets{

  Widget body(
      PageController pageController,
      List<String> imageList,){
    return SingleChildScrollView(
      child: Column(
        children: [
          top(),
          SizedBox(
            height: 5,
          ),
          middle(pageController, imageList),
          SizedBox(
            height: 5,
          ),
          bottom(),
        ],
      ),
    );
  }

  AppBar appBar(){
    return AppBar(
      backgroundColor: Colors.white,

      /// foregroundColor: 컬러 일괄로 한번에 바꾸기
      foregroundColor: Colors.black,
      //elevation: 0 : 그림자 없애기
      elevation: 0,
      title: Text("복잡한 UI Review"),

      /// centerTitle: true : 타이틀을 가운데로
      centerTitle: true,

      /// automaticallyImplyLeading: false : 앱바에 뒤로가기안나옴
      automaticallyImplyLeading: true,

      /// leading : 왼쪽에 넣는 위젯
      /// action : 오른쪽에 넣는 위젯

      actions: [
        /// Button 종류들은 기본적으로 간격이 들어가 있음.
        IconButton(
            onPressed: () {
              debugPrint("+ 버튼클릭");
            },
            icon: Icon(Icons.add)),

        /// GestureDetector의 터치 범위가 IconButton보다 훨작음. child 영약만 클릭됨
        /// GestureDetector는 터치시 그래픽 효과가 없다.
        GestureDetector(
          onTap: () {
            debugPrint("- 버튼 클릭");
          },
          child: Icon(Icons.remove),
        ),

        /// InkWell : 터치했을때 잉크가 물결처럼 퍼지는 효과를 준다.
        InkWell(
          onTap: () {
            debugPrint("카메라 버튼 클릭");
          },

          /// splashColor : 기본적인 물결퍼지는 색상.
          splashColor: Colors.red,
          highlightColor: Colors.green,

          /// focusColor : 버튼을 클릭하고 탭 누르면 확인가능한 색. 모바일은 안됨. 웹에서나 쓰는 기능.
          focusColor: Colors.orange,

          /// overlayColor : 물결퍼지는거 없애고 클릭 컬러만 나옴
          overlayColor: MaterialStateProperty.all(Colors.yellow),

          /// hoverColor : 마우스 올렸을때 색깔. 모바일에서 못봐요 ~
          hoverColor: Colors.purple,

          /// customBorder: const CircleBorder() : 물결 퍼지는걸 원형으로 바꿈.
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }

  Widget top() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시", Colors.red, () {
              debugPrint("택시클릭");
            }),
            iconItem("블랙", Colors.orange, () {
              debugPrint("블랙클릭");
            }),
            iconItem("바이크", Colors.yellow, () {
              debugPrint("바이크클릭");
            }),
            iconItem("대리", Colors.green, () {
              debugPrint("대리클릭");
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시", Colors.blue, () {
              debugPrint("택시클릭");
            }),
            iconItem("블랙", Colors.blueAccent, () {
              debugPrint("블랙클릭");
            }),
            iconItem("바이크", Colors.purple, () {
              debugPrint("바이크클릭");
            }),
            SizedBox(
              width: 80,
            )
          ],
        ),
      ],
    );
  }

  Widget middle(
      PageController pageController,
      List<String> imageList,
      ) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: pageController,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(imageList[index]).image),
              ));
        },
      ),
    );
  }

  Widget bottom() {
    return ListView.builder(
      itemCount: 10,

      /// physics: NeverScrollableScrollPhysics 스크롤 뷰 안에 또 스크롤 뷰 안들어가게 방지
      physics: NeverScrollableScrollPhysics(),

      /// shrinkWrap: true : 자식의 사이즈만큼만 리스트뷰를 그리겠다는 뜻.
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          splashColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          onTap: () {

            debugPrint('$index 번째 항목 클릭');
          },
          child: SizedBox(
            height: 50,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.notifications_none),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "[이벤트] 이것은 공지사항입니다",
                  style: TextStyle(
                      color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Function() onPressed : 함수로 빼기 !
  /// 밑에 onPressed: () => onPressed() !
  ///  Color color : 컬러도 함수로 빼기 ! 밑에 foregroundColor 에 color 넣어주기
  Widget iconItem(String text, Color color, Function() onPressed) {
    return SizedBox(
      width: 75,
      height: 75,
      child: TextButton(
        /// style: TextButton.styleFrom(foregroundColor: Colors.black) : 텍스트버튼에서 일괄 색 변경
        style: TextButton.styleFrom(

          /// foregroundColor: 일괄 색 변경
            foregroundColor: color,

            /// shape: RoundedRectangleBorder : 터치시 효과
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: () => onPressed(),
        child: Column(
          children: [
            const Icon(
              Icons.local_taxi,
              size: 35,
            ),

            /// foregroundColor로 일괄색 변경 해도 TextStyle로 따로 색 지정해주면 그거 우선임 !
            /// 따라서 택스트 색만 검정색으로 바꾸는게 가능 !
            Text(text,
                style: TextStyle(
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }


}