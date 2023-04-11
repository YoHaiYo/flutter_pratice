import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarrotMarket extends StatefulWidget {
  const CarrotMarket({Key? key}) : super(key: key);

  @override
  State<CarrotMarket> createState() => _CarrotMarketState();
}

class _CarrotMarketState extends State<CarrotMarket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: '동네생활',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.where_to_vote_outlined),
            label: '내근처',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wechat_outlined),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '내 당근',
          ),
        ],
      )
      ,
      appBar: AppBar(
        title: Text("CarrotMarket"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _top(),
            const SizedBox(height: 20),
            _middle(),
            const SizedBox(height: 20),
            // _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _top(){
    return Container(
      color: Colors.orange,
      child: Row(
        children: [
          Text("분당동"),
          IconButton(onPressed: (){},
              icon: const Icon(
            Icons.keyboard_arrow_down_sharp
          )),

          /// 절대값으로 입력하면 기기 마다 이상해질듯. 나중에 상대값 명령어로 바꾸기
          SizedBox(width: 150,),

          IconButton(onPressed: (){},
              icon: const Icon(
                  Icons.search
              )),
          IconButton(onPressed: (){},
              icon: const Icon(
                  Icons.menu
              )),
          IconButton(onPressed: (){},
              icon: const Icon(
                  Icons.notifications_none
              )),
        ],
      ),
    );
  }

  Widget _middle(){
    return Column(
      children: [
        _middle_box("assets/sell1.png","갤럭시노트10 팔아요","성남시 분당구 분당동",12000),
        _middle_box("assets/sell2.png","아이폰12 팔아요","성남시 분당구 분당동",120000),
        _middle_box("assets/sell3.png","OOO 팝니다","성남시 분당구 OO동",10000),
        _middle_box("assets/sell4.png","OOO 팝니다","성남시 분당구 OO동",10000),
        _middle_box("assets/sell5.png","OOO 팝니다","성남시 분당구 OO동",10000),
        _middle_box("assets/sell6.png","OOO 팝니다","성남시 분당구 OO동",10000),
        _middle_box("assets/sell7.png","OOO 팝니다","성남시 분당구 OO동",10000),
      ],
    );
  }

  Widget _middle_box(String image_name, String text_sell, String text_address, int text_price){
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 100,
              child:
              Image.asset(
                image_name,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Text(text_sell),
              Text(text_address),
              /// 3자리 마다 (,) 찍는거 추가하기
              Text(text_price.toString() + '원'),
            ],
          )
        ],
      ),
    );
  }

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





}
