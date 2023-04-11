// Lion 클래스만들고 animal 클래스 상속 받기
// Lion내부에 변수만들기. 변수는 double weight;
import 'package:lecture_230304/ch2/animal/animal_SS.dart';
import 'package:lecture_230304/ch2/animal/animal_interface.dart';

import 'animal_SS.dart';
import 'animal_interface.dart';
import 'animal_interface_2.dart';

// 인터페이스 클래스를 쓰기 위해서는 다른 키워드 필요
// implements
// 상속과 인터페이스의 차이점은?
// 상속은 1개만 가능
// 인터페이스는 여러개 가능
class Lion extends Animal_SS implements AnimalInterface, AnimalInterface2{

  Lion(super.name, super.age, this.weight);

  double weight;


  @override
  void eat() {
    // TODO: implement eat
  }

  @override
  void sleep() {
    // TODO: implement sleep
  }

  @override
  String toString() {
    return 'Lion{weight: $weight}';
  }

  @override
  void hunting() {
    // TODO: implement hunting
  }

  @override
  void cry() {
    // TODO: implement cry
  }
}