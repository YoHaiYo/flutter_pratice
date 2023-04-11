// 1회차 강의 - 23.03.04

// 5가지 변수 타입
// int : 숫자(정수) 소수점x
// String : 문자
// double : 숫자(실수) 소수점o
// bool : True or False
// num : int + double

// 값을 설정할 때 3가지 필요 : 1.타입, 2.변수명, 3.값

// 변수 선언
// = : 17이라는 값을 int타입의 age변수에 넣어준다.
// ; : 코드를 마무리한다는 정의. 이거 안쓰면 코드 안돌아감.

// int age = 17;
// String name = "임미나"; //'' : 구글에서 적극적으로 요걸로 권장하긴하는데 상관없다.
// double weight = 49.1;
// double weight2 = 59.1;
// bool check = true;
// bool check2 = false;
// num number1 = 177;
// num number2 = 177.77;

class Variable {
  Variable() {
    int age = 17;
    String name = "임미나"; //'' : 구글에서 적극적으로 요걸로 권장하긴하는데 상관없다.
    double weight = 49.1;
    double weight2 = 59.1;
    bool check = true;
    bool check2 = false;
    num number1 = 177;
    num number2 = 177.77;

    name = "안녕하씨유"; //변수 수정
    print(name);
    name += " 저는 임미나에요."; //추가할때는 이렇게 +=
    print(name);
  }
}