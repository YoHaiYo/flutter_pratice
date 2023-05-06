import 'package:flutter/material.dart';

class FutureScreen extends StatefulWidget {
  const FutureScreen({Key? key}) : super(key: key);

  @override
  State<FutureScreen> createState() => _FutureScreenState();
}

class _FutureScreenState extends State<FutureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureScreen"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              /// await를 사용한다면, 동기 처리 : 순서대로 진행되기 때문에
              /// await를 지우면, 비동기 처리 : futureBasic함수가 완료되지 않아도 다음 코드 실행하기 때문
              await futureBasic().then((value) {
                print("value : $value");
              });
              print("함수 다음에 호출");
            },
            child: Text("버튼"),
          ),
          ElevatedButton(
              onPressed: () async {
                // Future<String> d1000 = delay1000();
                // print("d1000 : ${d1000}");

                final Stopwatch stopwatch = Stopwatch();
                stopwatch.start();

                /// await 없음 : 비동기 처리. 총 3초 걸림
                delay1000().then((value) =>
                    print("delay1000 : $value, ${stopwatch.elapsed}"));
                delay2000().then((value) =>
                    print("delay2000 : $value, ${stopwatch.elapsed}"));
                delay3000().then((value) =>
                    print("delay3000 : $value, ${stopwatch.elapsed}"));
                stopwatch.stop();
              },
              child: Text("delay test")),

          ElevatedButton(
              onPressed: () async {
                final Stopwatch stopwatch = Stopwatch();
                stopwatch.start();

                /// await 사용 : 동기 처리. 총 1+2+3=6초 걸림
                var d1 = await delay1000();
                print("d1 : $d1, ${stopwatch.elapsed}");
                var d2 = await delay2000();
                print("d1 : $d2, ${stopwatch.elapsed}");
                var d3 = await delay3000();
                print("d1 : $d3, ${stopwatch.elapsed}");
                stopwatch.stop();
              },
              child: Text("await")),

          ElevatedButton(onPressed: () {

            final Stopwatch stopwatch = Stopwatch();
            stopwatch.start();

            delay1000().then((value) async{
              // delay 1000이 완료된 후에 진입.
              print("delay1000 : $value, ${stopwatch.elapsed}");
              var d3000 = await delay3000();
              print("d3000 : $d3000, ${stopwatch.elapsed}");
              var d2000 = await delay2000();
              print("d2000 : $d2000, ${stopwatch.elapsed}");
              stopwatch.stop();
            });


          }, child: Text("Test 2")),

          /// 과제버튼
          ElevatedButton(onPressed: () async{
            var typevalue = await type(1);
            if(typevalue ==1){
              await product();
            }else if(typevalue==2){
              await category();
            }
            print("로직완료");

          }, child: Text("과제테스트")),

        ],
      ),
    );
  }

  /// Future를 사용할 것이고, return type은 void이다.
  /// async : 중괄호 앞에 사용.
  /// await : Future 함수 앞에 사용. Future 함수가 끝날 때까지 기다린다.
  /// 네트워크 통신을 할대 그 결과값을 가지고 무엇을 해야될때
  /// 혹은 해당 함수가 완료되고 다른 작업을 해야 할 때 await를 사용한다.
  Future<String> futureBasic() async{
    print("1");
    /// 1초 후에 특정 코드를 실행
    /// Future.delayed => 네트워크 통신
    await Future.delayed(
      Duration(milliseconds: 1000),
      () {
        print("2");
        print("3");
      },
    );
    return "완료";
  }

  Future<String> delay1000() async {
    await Future.delayed(Duration(seconds: 1));
    return "1000";
  }

  Future<String> delay2000() async {
    await Future.delayed(Duration(seconds: 2));
    return "2000";
  }

  Future<String> delay3000() async {
    await Future.delayed(Duration(seconds: 3));
    return "3000";
  }

  /// 잠깐과제
  // /// future 함수는 3개
  // /// 1. int를 return하는 Future 함수를 만들어주세요.
  // /// 2. bool값을 return 하는 Future함수(product)
  // /// 3. return값이 없는 Future 함수(category)
  // /// 1번 함수를 호출했을 때 return 값이 1이면 2번 함수
  // /// return 값이 2라면 3번 함수 호출
  //
  // /// 강사 "어려운 개념맞아요. 바로되면 천재죠. 6개월해도 헷갈리시는분도 있어요."

  Future<int> type(int value) async{
    print("type 함수");
    await Future.delayed(const Duration(seconds: 1));
    return value;
  }

  Future<bool> product() async{
    print("product 함수");
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<void> category() async{
    await Future.delayed(const Duration(seconds: 1));
    print("category 함수");
  }

}
