class Person{


  // 프로퍼티 : 클래스 안에 있는 변수
  String name = "";
  int age = 0;
  double weight = 0.0;

  // 생성자가 필요합니다.
  // 생성자는 클래스에서 항상 존재합니다.
  // 생성자란 무엇인가? : 클래스를 복제 할 수 있게 하는 함수(즉, 인스턴스화 : 메모리에 올라간다는 뜻)

  /// 생성자 1
  /// 클래스도 하나의 타입이다.
  // Person();

  // 생성자 2
  //Alt + insert -> Constructor() -> 전부 선택 :
  // this : 현재 클래스.
  // 클래스를 생성할때 생성자에서 프로퍼티(변수)의 값을 받는다.
  // Person(this.name, this.age, this.weight);

  /// 그런데 클래스의 생성자에는 여러가지 형태가 있습니다.
  //생성자 3
  // 이렇게 만들면 한꺼번 쓸 수 있다.
  // Person(this.name, this.age, this.weight){
  //   print('Person $name이(가) 생성되었습니다');
  // }

  // 생성자 4
  // Person 클래스를 생성할때 name과 age는 반드시 입력해야한다.
  // 그리고 weight는 나중에 입력해도 됩니다. 처음에 0이 자동입력됨. 그리고
  // Person(this.name, this.age, {this.weight = 0});

  // 생성자 5 : 어떤 변수인지 알 수 있는게 장점
  // 강사님은 이 생성자를 제일 선호한다고함. 산전수전 다 겪은 사람의 경험이다. 새겨듣자.
  Person({required this.name, required this.age, required this.weight});

  // 생성자 6 : 생성자 5과 비교해서 required 없으므로 굳이 강제로 안써도 되는 장점.
  // Person({
  //   this.name="",
  //   this.age = 0,
  //   this.weight = 0,
  // });

  // 클래스 출력 : 오버라이드하여 인스턴스의 출력을 변경
  // Alt + insert -> toString() -> 전부 선택 : 편리하게 클래스 출력시켜줌

  void talk (){
    print('$name 님이 말을 시작했습니다.');
  }

  @override
  String toString() {
    return 'Person{name: $name, age: $age, weight: $weight}';
  }


}