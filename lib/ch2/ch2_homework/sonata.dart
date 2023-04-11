import 'car.dart';

class Sonata extends Car{
  Sonata({required super.owner, required super.carName, required super.price});

  // 왜 자꾸 required 가 뜨는지...

  void oiling(){
    print("$owner가 $carName에 주유 했습니다.");
  }

}
