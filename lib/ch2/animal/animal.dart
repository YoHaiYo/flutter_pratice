// animal이라는 클래스를 만들어주세요.
// 변수(프로포티) 로는 age, owner, kind

// runm sleep 함수를 만들고 주세요.
/// run 함수에서는 -> print = $name이 달리고 있습니다.
/// sleep 함수에는 -> print = $name이 잠들었습니다.
///

class Animal {

  // 프로퍼티 : 클래스 안에 있는 변수
  // 초기의 변수 타입설정
  // 변수를 선언 해줘도 되고 안해도
  String owner = "";
  String kind = "";
  int age = 0;
  int age_month = 0;
  int birth_month = 0;
  double verlocity = 0;

  // 생성자란 무엇인가? : 클래스를 복제 할 수 있게 하는 함수(즉, 인스턴스화 : 메모리에 올라간다는 뜻)
  // 생성자 6 사용
  Animal({
    this.owner="",
    this.kind ="",
    this.age = 0,
    this.birth_month = 0,
    this.verlocity = 0
  });


  // return 타입은 void(비어있다는뜻)
  // 함수이름 run
  // 입력값없음.

  // String run () {
  //   return '$kind(이)가 시속 $verlocity km/h 로 달리고 있습니다.';
  // }

  String run ({double speed=27}) {
    return '$kind(이)가 시속 $speed km/h 로 달리고 있습니다.';
  }

  void sleep (){
    print('$kind(이)가 잠들었습니다.');
  }

  void analysis (){
    print('$kind의 주인은 $owner이고 나이는 $age살 입니다.');
    age_month = (age-1)*12+birth_month;
    print('또한 생일은 $birth_month월로 12월인 현재 생후 $age_month개월 입니다.');
  }

  @override
  String toString() {
    return '주인: $owner, 견종: $kind, 나이: $age';
  }

}