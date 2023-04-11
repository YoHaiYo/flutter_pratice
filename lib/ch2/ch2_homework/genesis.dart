import 'car.dart';

class Genesis extends Car{
  Genesis({required super.owner, required super.carName, required super.price});

  // 왜 자꾸 required 가 뜨는지...

  void washing(){
    print("$owner가 $carName을(를) 세차했습니다.");
  }

}
