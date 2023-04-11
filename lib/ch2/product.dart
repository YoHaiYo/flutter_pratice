// product 클래스.
// 함수는 int price , String name, String company, int count(몇회 구매했는지)
// buy함수 만들기. buy 함수를 호출하면 count가 1씩 증가합니다.
// count가 5인 제품을 만들어주세요.

// 놓침. 강사님 Git 에서 보고 복습하기


/// 내가 만들다 만것
// class Product {
//   int price = ;
//   String name = ;
//   String company ;
//   int count = 0;
//
//   Product({
//     this.price,
//     this.name,
//     this.company,
//     this.count = 0
//   });
//
//   void buy()
//     print('$count회 구매했습니다.');
//   }
//
//   @override
//   String toString() {
//     return 'product{price: $price, name: $name, company: $company, count: $count}';
//   }
// }

class Product {
  int price=0;
  String name;
  String company;
  int count = 0;

  Product({
    required this.price,
    required this.name,
    required this.company,
  });

  void buy() {
    count++;
    price=price+15000;
    print('귀하의 $company사의 $name의 구매 횟수 $count회이고 구매 금액은 총 $price원입니다');
  }
}