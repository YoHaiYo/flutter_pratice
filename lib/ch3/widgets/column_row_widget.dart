// Column, Row 같이 쓰는 형태.
// 앱개발할때 가장 많이 쓰는 형태다.
// 꼭 따라서 쳐보자.

import 'package:flutter/material.dart';

class ColumnRowWidget extends StatelessWidget {
  const ColumnRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 여기서 Container는 배경색 용도로 쓰였음.
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: [

          /// 상단 ---------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _container(100, 100, Colors.red),
              _container(150, 80, Colors.yellow),
            ],
          ),

          /// 중단 ---------------------

          /// Expanded : 컬럼 안에 있는 로우를, 세로 영역을 최대치로 확장
          /// Expanded 대신 SizedBox쓰면 컨테이너가 상단 바로 아래로 붙어버림!
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _container(170, 200, Colors.white),
              ],
            ),
          ),

          /// 하단 ---------------------
          SizedBox(
            height: 125,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Column Row example",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "더조은컴퓨터학원",
                      style: TextStyle(color: Colors.yellow),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      color: color,
      // decoration: BoxDecoration(border: Border.all(color: bordercolor)),
    );
  }
}