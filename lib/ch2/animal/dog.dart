// Animal 클래스 상속,
// interface 2개 구현
// 각각의 인터페이스는 1개의 함수를 가지고 있고,
// 함수는 return 값은 String, 입력값은 int입니다.
// 함수의 이름은 자유.
// dog 클래스에는 weight 변수가 있고,
// swim이라는 함수를 만들어주세요. -> print $name가 수영하고 있습니다.

import 'package:lecture_230304/ch2/animal/animal_SS.dart';

import 'animal_SS.dart';
import 'animal_interface.dart';
import 'animal_interface_2.dart';

class Dog extends Animal_SS implements AnimalInterface, AnimalInterface2{

  Dog(super.name, super.age, this.weight);

  double weight;


  @override
  void eat() {
  }

  @override
  void sleep() {
  }

  @override
  void cry() {
  }

  @override
  void hunting() {
  }


  @override
  String toString() {
    return 'Dog{weight: $weight}';
  }

  void swim(){
    print('$age살이고, $weight kg인 $name가 수영하고 있습니다.');

  }
}