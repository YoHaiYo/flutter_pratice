import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'json_model.dart';
// import 'json_model_homework.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewsScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                getHttp();
              },
              child: Text("Dio Test")),
          ElevatedButton(
              onPressed: () {
                getReadJson();
              },
              child: Text("getReadJson Test")),

          FutureBuilder(
            future: getReadJson(),
            builder: (context, snapshot) {
              // || : or
              // snapshot.hasData : snapshot이 데이터를 가지고 있으면 ture 없으면 false

              // 데이터 없을때 보여줌.
              // 데이터 불러올때까지 뺑글뺑글 모션으로 시간끌기
              if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            // 데이터 있을때 보여줌
            return Text(snapshot.data.toString());
          },
          ),
          ElevatedButton(onPressed: () {
            getNewsData();
          }, child: Text("NewsAPI")),

          Expanded(
            child: FutureBuilder(
              future: getNewsData(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  // itemCount: snapshot.data!.articles.length, : articles의 수 만큼 이미지 가져오기
                  itemCount: snapshot.data!.articles.length,
                  // itemCount: 10,
                  itemBuilder: (context, index) {
                    String? url = snapshot.data!.articles[index].urltoimage!;
                    if(url == null){
                      return Text("이미지 없음");
                    }
                  return Image.network(snapshot.data!.articles[index].urltoimage!);
                },
                );


            },
            ),
          )

          // ElevatedButton(onPressed: () {
          //   getReadJsonHW();
          // }, child: Text("HW")),
        ],
      ),
    );
  }

  /// NEWS API 라는 사이트의 API. 뉴스 정보를 json형태로 제공해줌->API 호출가능. 무료라서 API 연습용으로 가능.
  final dio = Dio();

  void getHttp() async {
    /// 해당 링크의 html 코드를 불러옴.
    // final response = await dio.get('https://dart.dev');
    final response = await dio.get('https://newsapi.org/v2/everything?q=Apple&from=2023-04-28&sortBy=popularity&apiKey=506550cdac8546b5ae0f9f1983bd1ecc#');
    print(response);
  }

  /// json 파일 값 읽어오기
  Future<JsonModel> getReadJson() async {
    // response는 아직 json형태임.
    final String response =
        await rootBundle.loadString("assets/json_example.json");
    // print(response);
    //map 형식으로 변경해줘야함.
    var map = jsonDecode(response); // response : 데이터 다 가져옴

    JsonModel jsonModel = JsonModel.fromJson(map);
    print(jsonModel);

    await Future.delayed(Duration(seconds: 1));

    return jsonModel;
  }

  Future<JsonModel> getNewsData()async{
    final Dio d = Dio();
    String url = "https://newsapi.org/v2/everything?q=blackpink&from=2023-04-28&sortBy=popularity&apiKey=506550cdac8546b5ae0f9f1983bd1ecc#";

    var response = await d.get(url);
    // print(response);

    var result = JsonModel.fromJson(response.data);
    print("result : $result");
    return result;
  }

}
