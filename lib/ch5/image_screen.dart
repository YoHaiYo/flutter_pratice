import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  // 이미지 주소가 워낙 길어서 이런식으로 빼서 씁니다 ~
  String imageURL =
      "https://cdn.crowdpic.net/detail-thumb/thumb_d_063DAEEB0F38A7790E55E5BC036E6704.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImageScreen"),
      ),
      body: Center(
        child: _networt(),
      ),
    );
  }

  /// 이미지 넣는법
  // png : 배경이 투명함 -> 대부분의 디자이너가 png로 작업해서 준다. 아이콘 등등
  // jpg : 일반적인 이미지(배경 불투명)

  // BoxFit.contain : 이미지 비율 유지함. 가능한한 크게 그림. (이게 기본값임)
  // BoxFit.cover : 이미지 비율을 유지하되 폭, 높이에 꽉 차게 확대되서 그림.
  // BoxFit.fill : 이미지 비율을 무시. 이미지 위젯 꽉 채움.
  // BoxFit.fitHeight : 이미지 비율 유지. 이미지 위젯의 높이 길이에 맞춰서 그림.
  // BoxFit.fitWidth : 이미지 비율 유지. 이미지 위젯의 폭 길이에 맞춰서 그림.

  // alignment : 이미지 위젯 내에서 이미지를 어디로 배치 시킬지 결정
  // 제일 많이 상요하는 특성 : BoxFit.cover
  // alignment는 많이 사용하지 않음.

  Widget _image() {
    return Container(
      color: Colors.blue,
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/road1.jpg",
        fit: BoxFit.contain,
        alignment: Alignment.topLeft,
      ),
    );
  }

  // colorBlendMode: BlendMode. : color랑 같이 쓰면 포토샵의 블랜드 효과
  // errorBuilder : 이미지 오류나는거 파악용

  Widget _networt() {
    return Image.network(
      imageURL,
      color: Colors.blueAccent,
      colorBlendMode: BlendMode.screen,
      fit : BoxFit.cover,

      errorBuilder: (context, error, stackTrace) {
        return Text("error");
      },

    );
  }
}
