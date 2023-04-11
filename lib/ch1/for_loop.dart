class Forloop{
  Forloop(){

    normalForLoop();
    enhancedForLoop();
    forEachLoop();
    doubleFor1();

  }

  //반복문

  // 반복문 형태 1 : normalForLoop
  void normalForLoop(){
    print(" ----------- normalForLoop ----------- ");

    // for문의 형태
    // int i = 0 : 값
    // i<5 : 종료 조건, true면 통과, false면 종료.
    // i가 5보다 작다 i = 4 -> true 통과
    // i = 10 -> false 종료
    // i++ : 1회 반복할 때 마다 실행되는 연산자
    for(int i=1; i<5; i++){
      print('Forloop.normalForLoop i : $i');
    }

    // 곱으로 반복하고 싶을땐 i=i*2 이런 형식으로
    for(int i=1; i<5; i=i*2){
      print('Forloop.normalForLoop i : $i');
    }

    // list.length 배열의 개수(길이)를 반환 => a,b,c,d,e이면 5
    // i < list.length => i가 list 배열의 개수만큼 반복됨.

    List<String> list = ["a", "b","c","d","e"];

    for(int i=0; i < list.length; i++){
      print('Forloop.normalForLoop i : $i, ${list[i]}');
    }

  }

  // 반복문 형태 2 : enhancedForLoop
  // 얘가 더 보기 좋음.

  void enhancedForLoop(){
    print(" ----------- enhancedForLoop ----------- ");

    List<String> list = ["가","나","다","라","마"];

    // String value 값에는 list 배열의 값들이 차레차례 들어옵니다.
    // in => list 배열안에는 있는(in) String value 값을 반복해서 출력해준다.
    for(String value in list){
      print('Forloop.enhancedForLoop : $value');
    }

  }

  // 단축키 : list.for 하나아래 엔터
  // 알아서 리스트, 변수명 가져와서 for문 만들어준다. for문을 많이 작성해야 할때 편리하게 for을 작성하는 용도.

  // 반복문 형태 3 : forEachLoop
  void forEachLoop(){
    print(" ----------- forEachLoop ----------- ");

    List<String> list = ["가","나","다","라","마"];

    //list 배열에 있는 값이 차례차례 호출된다.
    list.forEach((element) {
      print('Forloop.forEachLoop : $element');
    });

  }

  // 잠깐 예제
  // double 값으로 만들어진 배열을 for을 사용해서 print 출력하기
  void doubleFor1(){
    print(" ----------- 예 제 ----------- ");


    List<double> list = [1,12,54.5,77.17,455];

    for(double value in list){
      print('Forloop.doubleFor : $value');
    }

  }
}