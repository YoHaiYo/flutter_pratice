// 1회차 강의 - 23.03.04


// 1. if문 사용
// return타입은 String이고, 입력값은 int인 함수를 만들어주세요.
// 그리고 입력값이 90이상이면 A
// 그리고 입력값이 80이상이면 B
// 그리고 입력값이 70이상이면 C
// 그리고 입력값이 60이상이면 D
// 그리고 입력값이 50이상이면 E
// 그리고 입력값이 40이하이면 F

class Conditional_test {

  Conditional_test() {
    conditional_test_If(92);
    conditionalSwitch_test(7);
  }
}

void conditional_test_If(int value) {
  if (value >= 90) {
    print('Conditional.conditionalIf value의 값은 A 입니다.');
  } else if (value >= 80) {
    print('Conditional.conditionalIf value의 값은 B 입니다.');
  } else if (value >= 70) {
    print('Conditional.conditionalIf value의 값은 C 입니다.');
  } else if (value >= 60) {
    print('Conditional.conditionalIf value의 값은 D 입니다.');
  } else if (value >= 50) {
    print('Conditional.conditionalIf value의 값은 E 입니다.');
  } else {
    print('Conditional.conditionalIf value의 값은 F 입니다');
  }
}

// 2. switch문 사용
// return타입은 String 입력값은 int인 함수 사용.
// 입력값이 1인 경우 월요일
// 입력값이 2인 경우 화요일
// 입력값이 3인 경우 수요일
// 입력값이 4인 경우 목요일
// 입력값이 5인 경우 금요일
// 입력값이 6인 경우 토요일
// 입력값이 7인 경우 일요일

void conditionalSwitch_test(int value){

  switch(value) {
    case 1 :
      print('Conditional.conditionalSwitch value의 값은 월요일 입니다.');
      break;
    case 2 :
      print('Conditional.conditionalSwitch value의 값은 화요일 입니다.');
      break;
    case 3 :
      print('Conditional.conditionalSwitch value의 값은 수요일 입니다.');
      break;
    case 4 :
      print('Conditional.conditionalSwitch value의 값은 목요일 입니다.');
      break;
    case 5 :
      print('Conditional.conditionalSwitch value의 값은 금요일 입니다.');
      break;
    case 6 :
      print('Conditional.conditionalSwitch value의 값은 토요일 입니다.');
      break;
    default :
      print('Conditional.conditionalSwitch value의 값을 일요일 입니다.');
      break;
  }

}