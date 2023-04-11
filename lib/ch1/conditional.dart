// 1회차 강의 - 23.03.04

class Conditional {

  // 조건문
  // If, switch => 만약에
  Conditional(){
    conditionalIf("k"); // String value = "k" 랑 똑같음!
    conditionalSwitch("a");
  }
// if문
// value를 입력 받는 함수로 바꾼거임
  void conditionalIf(String value){
    // String value = "c";

    // value가 a와 같다면 true, 다르다면 false
    if(value == "a"){
      // value가 a와 같아서 true인 경우 진입
      print('Conditional.conditionalIf value의 값은 a 입니다.');
    } else if(value == "b"){
      print('Conditional.conditionalIf value의 값은 b 입니다.');
    } else {
      // a도 아니고 b도 아닌 모든 경우
      print('Conditional.conditionalIf value의 값을 찾을 수 없습니다.');
    }

  }

  // switch문
  // 사실 if문만 써도 됨. 근데 switch문이 깔끔해 보일때가 있음.
  void conditionalSwitch(String value){

    switch(value) {
      case "a" :
        print('Conditional.conditionalSwitch value의 값은 a 입니다.');
        break;
      case "b" :
        print('Conditional.conditionalSwitch value의 값은 b 입니다.');
        break;
      default :
        print('Conditional.conditionalSwitch value의 값을 찾을 수 없습니다.');
        break;
    }

  }
}

// 과제