// 23.03.19 과제 함

abstract class Car {
// class Car {

  //생성자 5
  Car({required this.price, required this.carName, required this.owner});
  // 왜 자꾸 required 가 뜨는지...

  //프로퍼티
  double price = 0;
  String carName = "" ;
  String owner = "" ;

  //매서드
  void run(){
    print("$carName이(가) 달리고 있습니다.");
  }
  void stop(){
    print("$carName이(가) 정지했습니다.");
  }

  @override
  String toString() {
    return 'car{owner: $owner, carName: $carName, price: $price}';
  }
}