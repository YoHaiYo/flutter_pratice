import 'package:flutter/material.dart';

class MarketplaceApp extends StatefulWidget {
  @override
  _MarketplaceAppState createState() => _MarketplaceAppState();
}

class _MarketplaceAppState extends State<MarketplaceApp> {
  List<Product> _products = [
    Product(
      name: 'Apple',
      price: 1.5,
      description: 'Fresh and juicy apples from local farms',
      image: 'assets/apple.jpg',
      color: Colors.redAccent,
    ),
    Product(
      name: 'Banana',
      price: 2.0,
      description: 'Sweet and ripe bananas from tropical climates',
      image: 'assets/banana.jpg',
      color: Colors.yellowAccent,
    ),
    Product(
      name: 'Orange',
      price: 1.8,
      description: 'Tangy and delicious oranges from sunny groves',
      image: 'assets/orange.jpg',
      color: Colors.orangeAccent,
    ),
    Product(
      name: 'Strawberry',
      price: 3.0,
      description: 'Plump and juicy strawberries from local farms',
      image: 'assets/strawberry.jpg',
      color: Colors.pinkAccent,
    ),
    Product(
      name: 'Grapes',
      price: 2.5,
      description: 'Sweet and succulent grapes from vineyards',
      image: 'assets/grapes.jpg',
      color: Colors.purpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marketplace'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    product: _products[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: _products[index].color,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      _products[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _products[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '\$${_products[index].price}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String description;
  final String image;
  final Color color;

  const Product({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.color,
  });
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: product.color,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    primary: product.color,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

