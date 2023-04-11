
// 상수 -> 변하지 않는 변수 / 타입 -> (항)상수
// 변수 -> 변하는 변수 / 타입 -> 변(하는)수

// 상수에는 2가지가 있음.
// 1. final
// 2. const -> static 과 같이 사용

// static const 가 무슨 뜻이냐?
// - 변하지 않는 값
// - compile 시에 이미 정해져 있는 값.
// - static으로 선언하면 다른데서도 접근 가능 -> 즉, ()없이 쓸 수 있어요.
//
class Constant{

  Constant(this.work);

  // 생성할 때 값을 값을 입력합니다. ( = 이 없으니까.)
  // 물론 final 키워드가 있기 때문에 변경 불가.
  final bool work;

  // final은 Constant 클래스를 생성 할때 정해짐.
  // 변하지 않는 값이다.
  // 앱/소프트웨어가 실행되는 시점에서 존재하는 값

  final int age = 17;
  final String name = "임미나";

  // 절대 안바뀜
  // Constant 클래스를 생성하지 않아도 이미 존재하는 값이다.
  // 앱/소프트웨어가 설치되는 시점에서 이미 존재하는 값

  static const int age3 = 27;

}

// final은 실행하면 정해지니까 설치하는 용량을 줄일 수 있어요.
// const가 많아지면 용량이 커져요. 그러나 일반적인 앱에서는 절대 그 차이가 체감이 안날 정도로 영향이 적어요.

// 클래스 밖에 쓰면 static 지워야함.
const int age4 = 37;