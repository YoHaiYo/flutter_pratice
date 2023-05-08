// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lecture_230304/ch1/collections.dart';
import 'package:lecture_230304/ch1/conditional.dart';
import 'package:lecture_230304/ch1/for_loop.dart';
import 'package:lecture_230304/ch1/method.dart';
import 'package:lecture_230304/ch1/method_review.dart';
import 'package:lecture_230304/ch1/operator.dart';
import 'package:lecture_230304/ch1/variable.dart';
import 'package:lecture_230304/ch2/animal/bird.dart';
import 'package:lecture_230304/ch2/animal/dog.dart';
import 'package:lecture_230304/ch2/animal/lion.dart';
import 'package:lecture_230304/ch2/ch2_homework/benz.dart';
import 'package:lecture_230304/ch2/ch2_homework/genesis.dart';
import 'package:lecture_230304/ch2/ch2_homework/homework_teacher.dart';
import 'package:lecture_230304/ch2/ch2_homework/sonata.dart';
import 'package:lecture_230304/ch2/person.dart';
import 'package:lecture_230304/ch2/ch2_homework/car.dart';

import 'package:lecture_230304/main.dart';

void main() {

  // --------------- 1주차 ---------------

  // Variable();
  // Operator();
  // Method();
  // Method1();
  // MethodReview();
  // Conditional();
  // Conditional_test();
  // Ch1HomeworkConditional();

  // --------------- 2주차 ---------------

  // Collections();
  // Forloop();

  // Person(); // 이게 생성자임.
  // String name = "";
  // Person person1 = Person();
  // person1.name = "임미나";
  // person1.age = 17;
  // person1.weight = 47.9;
  //
  // print('person1 : $person1');
  //
  // Person person2 = Person();
  // person2.name = "김사나";
  // person2.age = 21;
  // person2.weight = 49.7;
  //
  // print('person2 : $person2');
  //
  // 위 처럼 name, age, weight 따로 쓰기 귀찮으면 아래처럼 한꺼번 쓸 수 있다.
  // Person my = Person("임미나",17,49.9);
  //
  // Person my = Person("임미나", 17);
  // my.weight = 47;
  // print('Person : $my');
  //
  // // 생성자 4 : weight는 꼭 변수명을 써야입력됨/
  // Person my2 = Person("임미나", 23, weight: 49.7);
  // print('Person : $my2');
  //
  // Person person = Person(name: "임미나", age: 11, weight: 12);
  // print('person : $person');
  // person.talk();

  // Animal animal = Animal(owner: "임미나", kind: "시바견", age:5, birth_month:5, verlocity: 17.7);
  // print('[$animal]');
  // // animal.run();
  //
  // animal.sleep();
  // animal.analysis();
  //
  // String run = animal.run(speed: 37.7);
  // print('현재 $run');
  //
  // var product = Product(price: 0, name: "치킨", company: "BBQ");
  // for (int i = 0; i < 5; i++) {
  //   product.buy();
  // }

  // Bird bird = Bird('비둘기',1);
  // bird.name;
  // bird.age;
  // bird.run();

  // Lion lion = Lion("미나",1,20);
  // print('lion : $lion');

  // Dog dog = Dog("흰둥이",3,7.7);
  // dog.swim();
  // print('$dog');

  // 왜 Car와 Benz, Genesis, Sonata는 같이 출력안되나? : Car는 추상 클래스라서.
  // Car car = Car(owner: '임미나', carName: '기아 레이', price: 2500);
  // print('$car');
  // car.run();
  // car.stop();

  //
  // Benz benz = Benz(owner: "김사나", carName: '메르세데스 벤츠', price: 9000);
  // benz.repair();
  // benz.sell();
  //
  // Genesis genesis = Genesis(owner: "김사나", carName: '제네시스', price: 8000);
  // genesis.washing();
  //
  // Sonata sonata = Sonata(owner: "김사나", carName: '소나타', price: 4000);
  // sonata.oiling();

  Ch2Homework();

}