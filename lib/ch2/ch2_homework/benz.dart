import 'package:lecture_230304/ch2/ch2_homework/carinterface.dart';

import 'car.dart';

class Benz extends Car implements CarInterface{
  Benz({required super.owner, required super.carName, required super.price});

  // 왜 자꾸 required 가 뜨는지...

  void repair(){
    print("$owner가 $carName을(를) 수리했습니다.");
  }

  @override
  void sell() {
    print("$owner가 $carName를 $price만원에 판매했습니다.");
  }

}
