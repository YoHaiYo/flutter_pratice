// bird 클래스를 만들어주세요.
// animal 클래스를 상속받으세요. (extends사용)
// animal 클래스안에 String name, int age 추가하기

import 'package:lecture_230304/ch2/animal/animal_SS.dart';

import 'animal_SS.dart';

// 부모클래스, 자식클래스
// 부모클래스 : Animal
// 자식클래스 : bird
// Bird(자식)가 Animal(부모)을 상속받은 것
// 자식클래스는 부모클래스의 변수와 함수를 사용할 수 있습니다.

class Bird extends Animal_SS{

  //Bird는 Animal에게 name과 age를 넘겨야한다. 그 방식이 super다.
  Bird(super.name, super.age);

  // 아래와 같은 방식도 있다. 미완
  // Bird({required String name, required int age});


  @override
  void eat() {
  }

  @override
  void sleep() {
  }

  @override
  void run() {
    // 부모 클래스에 있는 run을 호출하는 방법.
    // 주석처리하면 bird만의 run함수를 적용할 수 있다.
    super.run();
    print("새가 도망갑니다.");
  }

}