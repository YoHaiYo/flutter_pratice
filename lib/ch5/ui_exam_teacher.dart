import 'package:flutter/material.dart';

class UiExamTeacher extends StatefulWidget {
  const UiExamTeacher({Key? key}) : super(key: key);

  @override
  State<UiExamTeacher> createState() => _UiExamTeacherState();
}

class _UiExamTeacherState extends State<UiExamTeacher> {
  final PageController pageController = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Text("복잡한 UI"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // SingleChildScrollView : 스크롤
      body: SingleChildScrollView(
        child: Column(
          children: [
            _top(),
            const SizedBox(height: 20),
            _middle(),
            const SizedBox(height: 20),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _top() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시"),
            iconItem("블랙"),
            iconItem("바이크"),
            iconItem("대리"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconItem("택시"),
            iconItem("블랙"),
            iconItem("바이크"),
            const SizedBox(width: 50),
            // iconItem("대리"),
          ],
        )
      ],
    );
  }

  Widget iconItem(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.local_taxi,
              size: 32,
            )),
        Text(text),
      ],
    );
  }

  Widget _middle() {
    return SizedBox(
      height: 200,
      child: PageView(
        controller: pageController,
        children: [
          image("assets/road1.jpg"),
          image("assets/road2.jpg"),
          image("assets/road3.jpg"),
        ],
      ),
    );
  }
  //String imageinsect = "assets/road1.jpg";

  Widget image(String imageinsect) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // ClipRRect : 둥근 직사각형 클립을 작성합니다.
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            child:
            Image.asset(
          imageinsect,
              fit: BoxFit.fitHeight,
            ),
        ),
      ),
    );
  }



  Widget _bottom() {
    /// ListView : 필요에 따라 생성되는 스크롤 가능한 선형 위젯 배열을 만듭니다. 자식 수가 많거나 무한한 리스트 뷰에 적합합니다.
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 60,
          child: Row(
            children: const [
              SizedBox(width: 20),
              Icon(Icons.notifications_none_sharp),
              SizedBox(width: 20),
              Text("[이벤트]이것은 공지사항입니다.")
            ],
          ),
        );
      },
      itemCount: 5,
    );
  }

}