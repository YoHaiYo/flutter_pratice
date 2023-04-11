// 상속에 대한 파일입니다. (SS = 상속)

// Class Dog에 Animal을 상속 시키면 Animal 안에 있는 sleep함수를 Class Dog에서도 쓸 수 있게 해준다!

// abstract class : 추상클래스
// 추상클래스는 상속을 받지않으면 생성 불가
abstract class Animal_SS {
  Animal_SS(this.name, this.age);

  String name = "" ;
  int age = 0;

  // {} : 함수의 구현부

  void sleep();

  void eat();

  void run(){

    print("도망간다");
  }

}