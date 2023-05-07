// 1회차 강의 - 23.03.04

import 'dart:ffi';

class Operator {
  // 연산 :
  // 산술연산자 : 사칙연산
  // 증감연산자 : 더하기, 빼기
  // 비교연산자 : A가 B보다 큰지, 작은지, 같거나큰지, 같거나작은지
  // 논리연산자 : 그리고(and), 아니면(or)
  Operator(){
    add();
    minus();
    divide();
    multiple();
    upAndDown();
    simpleTest();
    compare();
    logical();
    typeCasting();
  }

  // 함수
  // 중괄호를 열고 닫음으로써 구현 여부를 알 수 잇다.
  void aaa(){
    // 2.구현, 코드작성
  }

  // 함수
  // 산술연산자 : 더하기
  void add(){
    int age = 30;
    print(age);
    age = 30 + 20;
    print(age);
    age += 3;//+= : 기본꺼에 더해라
    print(age);

    String name = "안녕하세요";
    print('Operator.add name1 : $name');
    name += " 저는 임미나에요!.";
    print('Operator.add name2 : $name');

    print("---add---");
  }


  void minus() {
    int width = 100;
    //soutm : 어느 위치에서 print가 됬는지를 알고 싶을때 단축 명령어
    print('Operator.minus width1 : $width'); // 문자열("") 안에 변수 값을 넣고 싶을땐 $ 기호가 필요.

    width = 30 - 10 ;
    print('Operator.minus width2 : $width');
    print('Operator.minus width3 : $width');
    print("---minus---");
  }

  //나누기
  void divide(){
    double age = 10 / 2 ; //int는 나누기 안됨.
    print('Operator.divide age : $age');

    double age2 =  8 % 3 ; // % : 나누기 후 나머지를 반환함. 나머지 0.5를 반올림해서 1로 출력
    print('Operator.divide age2 : $age2');

    int age3 = 5~/2; // ~/ : 몫을 구해서 정수로 반환. 그래서 int로 써야됨.
    print('Operator.divide age3 : $age3');
    print("---divide---");
  }

  void multiple(){
    int age = 10 * 20;
    print('Operator.multiple age : $age');
    print("---multiple---");
  }

  //증감연산자

  void upAndDown(){
    int age = 30;
    print('Operator.upAndDown age1 : $age');
    age++; // ++ : 1이 증가함
    print('Operator.upAndDown age2 : $age');
    age--; // -- : 1이 감소함.
    age--;
    age--;
    print('Operator.upAndDown age3 : $age');
    print("---upAndDown---");
  }

  // 간단한 예제. 문자 사이에 변수 출력하기.
  void simpleTest(){

    // String name = "안녕하세요. 저는 ";
    // name += "임미나";
    // name += "입니다. 제 나이는 ";
    // int age = 17;
    // String name3 = "살 입니다.";
    // print(name);
    // print() 안녕하세요. 저는 000입니다. 제 나이는 00살입니다. 00은 변수로

    String name = "임미나";
    int age = 17;
    print('안녕하세요. 저는 $name입니다. 제 나이는 $age살입니다.');
    print("---simpleTest---");
  }
  // ㅇㅇ

  // 비교연산자 : 개발자들은 정말 자주쓰는 연산자에요.
  // ==,!=,<,>,>=,<=
  void compare(){
    double value1 = 2;
    double value2 = 2.1;
    print('Operator.compare ${value1 <= value2}'); // { }로 감싸줘야 긴 비교가 인식됨 !
    // 같으면 True , 틀리면 False
    print("---compare---");
  }

  // 논리연산자 : &&=and, ||=or (쉬프트 원화키)
  void logical(){
    // double v1 = 2;
    // double v2 = 3;
    print('Operator.logical : ${true && true}');
    print("---logical---");
  }

  //타입변환, 형변환.
  void typeCasting(){
    int age = 30;
    double weight = 49.5;

    age = 50; // 50
    age = weight.toInt(); //age가 int 타입이기 때문에, double 타입인 weight를 int로 바꿔줘야 합니다.
    print('Operator.typeCasting age : $age');
    print("---typeCasting---");
  }

}