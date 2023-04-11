/// 의류 쇼핑몰 앱
/// main에 붙여서 실행

import 'package:flutter/material.dart';

class ClothesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 0.75,
        children: [
          _buildClothesItem(
            context,
            'https://cdn.sosandar.com/media/catalog/product/cache/0ad62aa88f50338ba969372be71afacb/w/e/web_119_s21dw176gn0016_001.jpg',
            'Summer Dress',
            '\$49.99',
          ),
          _buildClothesItem(
            context,
            'https://cdn.shopify.com/s/files/1/0022/0620/3948/files/FW_22_02_0130_Final_73573114-a603-4e4b-a20c-51ed2a0d924f.jpg?v=1667488879',
            'Leather Jacket',
            '\$99.99',
          ),
          _buildClothesItem(
            context,
            'http://cdn.shopify.com/s/files/1/1082/8686/collections/jeans1_1_grande.jpg?v=1604684425',
            'Denim Jeans',
            '\$39.99',
          ),
          _buildClothesItem(
            context,
            'https://www.landsend.com/article/tips-picking-right-length-winter-coats/images/20200102-m-02.jpg',
            'Winter Coat',
            '\$149.99',
          ),
          _buildClothesItem(
            context,
            'https://d2tc4gllfr2jwk.cloudfront.net/catalog/product/cache/4baacebb3a123e9342fd82a0a5e944af/b/_/b_767.jpg',
            'Winter Jacket',
            '\$139.99',
          ),
          _buildClothesItem(
            context,
            'https://img.ltwebstatic.com/images3_pi/2022/09/20/1663637168cd6b4cbaef4a07f5a0b5afe497556ed2_thumbnail_600x.webp',
            'Denim Coat',
            '\$119.99',
          ),
        ],
      ),
    );
  }

  Widget _buildClothesItem(
      BuildContext context, String imageUrl, String name, String price) {
    return GestureDetector(
      onTap: () {
        // Navigate to product detail page
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                  Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
