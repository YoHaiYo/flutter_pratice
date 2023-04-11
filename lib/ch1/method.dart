// 1회차 강의 - 23.03.04

class Method{
  Method(){
    // 11, 35입력
    int result = add(11, 35);
    //return으로 반환한것을 result로 다시 받는 것이다.
    //요렇게 하면 내가 만든 함수를 편하게 계속 쓸 수 있습니다~
    print('Method.Method result : $result');

  }

  void aaa(){
  }
  // add함수
  // 입력값 2개(int), 변환 값 1개
  // int값을 반환하고, 입력값 a와 b를 받는 add 함수입니다.
  dynamic add(int a, int b){
    int value = a + b;
    return value;
  }

//int add(int a, int b) => a + b; // 줄수 줄이기
}

//////////

class Method1 {
  Method1() {
    // 11, 35입력
    int result = minus(11, 35);
    //return으로 반환한것을 result로 다시 받는 것이다.
    print('Method.Method result : $result');

    String name = talk("임미나", time: DateTime.now().toString());
    //String name = talk("임미나");
    //time을 입력하면 그 시간으로 나오고, 입력안하면 밑에 기본으로 입력한 값으로 나옴.
    // DateTime.now() : 현재 시간보기. time을 toString()으로 글자로 변환하기.
    print('Method1.Method1 talk : $name');

    String introResult =  introduce("임미나", 17);
    print('Method1.Method1 introResult : $introResult');

    sleep(name: "임미나");

    bool checkResult = check(11); // 10넣어야 true 나와요.
    print('Method1.Method1 result : $checkResult');


  }

  void aaa1() {
  }

  int minus(int a, int b) {
    return a - b; //value로 안받아도 이렇게해도 됩니다. 한줄이라도 코드 줄이자.
  }

  // 함수 입력값 optional
  // time 값을 입력해도 되고, 입력하지 않아도 됩니다.
  // 소괄호 안에 있는 입력값은 함수를 호출할때 입력값의 이름을 보여주지 않는다.
  // 하지만 중괄호 안에 있는 입력값은 함술르 호출할때 입력값의 이름을 보여준다.

  String talk(String name, {String time = "16:50"}){
    return "$name님이 대화를 신청하셨습니다. $time";

  }

  //required 키워드를 입력 변수 앞에 넣으면 해당 변수의 값을 반드시 입력해야 합니다.!
  String sleep({required String name}){
    return "$name이 자고 있습니다.";

  }

  String introduce(String name, int age){
    return "안녕하세요. 저는 $name입니다. 제 나이는 $age입니다.";

  }

  // 변환값은 bool(boolean), 입력값은 int
  // 조건이 10과 같은 으면 true, 다르면 false
  bool check(int value){
    return value == 10;

  }

  String eat(String food){
    return "$food를 먹습니다.";
  }

/// lambda, 람다
/// => : FatArrow
/// -> arrow
///String eat(String food) => "$food를 먹습니다.";

///int minus(int a, int b) => a - b;

///int add(int a, int b) => a + b;

// lambda : 아래의 형태를 람다라고 함.
// => FatArrow
// -> arrow
//String eat(String food) => "$food를 먹습니다."; // 요기는 강사님 git 보고 복습하기


}