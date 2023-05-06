import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'open_item.dart';

class OpenApiScreen extends StatefulWidget {
  const OpenApiScreen({Key? key}) : super(key: key);

  @override
  State<OpenApiScreen> createState() => _OpenApiScreenState();
}

class _OpenApiScreenState extends State<OpenApiScreen> {
  List<OpenItem> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenApiScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                call();
              },
              child: Text("Call")),
          if (itemList.isEmpty) ...[
            const Center(child: CircularProgressIndicator()),
          ] else ...[
            // Expanded가 여기서 하는 역할
            // => Column의 남은 영역을 꽉 채워라
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  OpenItem item = itemList[index];
                  return Text("item category : ${item.category}, "
                      "fcstValue : ${item.fcstValue}");
                },
                itemCount: itemList.length,
              ),
            ),
          ],
          ElevatedButton(
              onPressed: () {
                /// https://pub.dev/packages/url_launcher#-installing-tab-
                _launchUrl();
              },
              child: Text("Go to URL")),
        ],
      ),
    );
  }

  /// 기상청_단기예보 ((구)_동네예보) 조회서비스 API
  void call() {
    Dio dio = Dio();
    String url =
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=Ikzw3SfvaxIdli8OxevjDkVYC5iCdUFCiSnzQXNuT81qkRZuwGA%2B9GTuGyRDBE7rDIMg3%2BkQJaRxk3ulGEMe9A%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20230428&base_time=0500&nx=55&ny=127";

    String baseUrl =
        "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
    String serviceKey =
        "Ikzw3SfvaxIdli8OxevjDkVYC5iCdUFCiSnzQXNuT81qkRZuwGA%2B9GTuGyRDBE7rDIMg3%2BkQJaRxk3ulGEMe9A%3D%3D";
    String pageNo = "1";
    String numOfRows = "10";
    String dataType = "JSON";
    String base_date = "20230428";
    String base_time = "0500";
    String nx = "55";
    String ny = "127";

    /// + 로 연결 시킬 필요가 없음. + 써도 실행되긴합니다~
    String u = "$baseUrl"
        "?serviceKey=$serviceKey"
        "&pageNo=$pageNo"
        "&numOfRows=$numOfRows"
        "&dataType=$dataType"
        "&base_date=$base_date"
        "&base_time=$base_time"
        "&nx=$nx"
        "&ny=$ny";

    print(u);

    setState(() {
      itemList.clear();
    });

    dio.get(u).then((value) {
      print(value.data);
    });

    dio.get(u).then((value) async {

      await Future.delayed(const Duration(milliseconds: 1000));

      if (value.data != null) {
        var data = value.data["response"]["body"]["items"]["item"];
        var list = data.map<OpenItem>((e) => OpenItem.fromJson(e)).toList();
        itemList.addAll(list);
        setState(() {});
      }
    });

  }

  /// URL 링크 연결주소
  final Uri _url = Uri.parse('https://flutter.dev');
  /// u로 만들어진 URL을 그대로 u로 입력하니까 안된다... 아직 해결못함.
  // final Uri _url = Uri.parse(u);

  /// URL 연결 패키지
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
