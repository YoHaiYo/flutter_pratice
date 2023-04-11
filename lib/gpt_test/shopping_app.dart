/// 의류 쇼핑몰 앱
/// main에 안붙이고 실행

import 'package:flutter/material.dart';

void main() => runApp(ShoppingApp());

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product({required this.name, required this.imageUrl, required this.description, required this.price});
}

class ShoppingApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: "Summer Dress",
      imageUrl: "https://cdn.sosandar.com/media/catalog/product/cache/0ad62aa88f50338ba969372be71afacb/w/e/web_119_s21dw176gn0016_001.jpg",
      description: "This is a Summer Dress",
      price: 69.99,
    ),
    Product(
      name: "Leather Jacket",
      imageUrl: "https://cdn.shopify.com/s/files/1/0022/0620/3948/files/FW_22_02_0130_Final_73573114-a603-4e4b-a20c-51ed2a0d924f.jpg?v=1667488879",
      description: "This is a Leather Jacket",
      price: 29.99,
    ),
    Product(
      name: "Denim Jeans",
      imageUrl: "http://cdn.shopify.com/s/files/1/1082/8686/collections/jeans1_1_grande.jpg?v=1604684425",
      description: "This is a Denim Jeans",
      price: 39.99,
    ),
    Product(
      name: "Winter Coat",
      imageUrl: "https://image.musinsa.com/mfile_s01/2019/10/04/4efdd2f969559e8b1c92e99f32ded48e160958.jpg",
      description: "This is a Winter Coat",
      price: 139.99,
    ),
    Product(
      name: "Tennis Skirt",
      imageUrl: "https://i.pinimg.com/736x/bc/fe/03/bcfe032db8472cd33b5bf8ef0ddb8968.jpg",
      description: "This is a Tennis Skirt",
      price: 29.99,
    ),
    Product(
      name: "Spring shirt",
      imageUrl: "https://image.spreadshirtmedia.com/image-server/v1/products/T813A386PA4249PT17X9Y48D13247492W26069H35289/views/1,width=378,height=378,appearanceId=386,backgroundColor=F2F2F2,modelId=338,crop=list/pelargonium.jpg",
      description: "This is a Spring shirt",
      price: 19.99,
    ),
  ];

  /// 홈 화면에서의 상품 배치 디자인
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SSH 쇼핑몰"),
        ),
        body: GridView.builder(
          itemCount: products.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: products[index]),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Image.network(products[index].imageUrl),
                    ),
                    Text(products[index].name),
                    Text("\$${products[index].price.toStringAsFixed(2)}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          onPressed: () {

                            // 클릭시 메시지 출력 시작
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                  title: Text("알림"),
                                  content: Text("상품을 장바구니에 추가했습니다."),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("확인"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            // 클릭시 메시지 출력 끝

                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {

                            // 클릭시 메시지 출력 시작
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.blue),
                                  ),
                                  title: Text("알림"),
                                  content: Text("상품을 즐겨찾기에 추가했습니다."),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text("확인"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            // 클릭시 메시지 출력 끝

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },


        ),
      ),
    );
  }
}

/// 상품 상세 페이지보기
class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(product.imageUrl),
          ),
          Text(product.name),
          Text("\$${product.price.toStringAsFixed(2)}"),
          Text(product.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                child: Text("장바구니에 추가"),
                onPressed: () {
                  // 클릭시 메시지 출력 시작
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blue),
                        ),
                        title: Text("알림"),
                        content: Text("상품을 장바구니에 추가했습니다."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("확인"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // 클릭시 메시지 출력 끝

                },
              ),
              ElevatedButton(
                child: Text("♥"),
                onPressed: () {

                  // 클릭시 메시지 출력 시작
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blue),
                        ),
                        title: Text("알림"),
                        content: Text("상품을 즐겨찾기에 추가했습니다."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("확인"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  // 클릭시 메시지 출력 끝

                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      //double.infinity : 최대값 사용
      width: double.infinity, height: 70, padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}

