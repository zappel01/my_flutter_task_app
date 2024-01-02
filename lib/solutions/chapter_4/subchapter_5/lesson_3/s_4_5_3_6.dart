import 'package:flutter/material.dart';

class S4536 extends StatelessWidget {
  const S4536({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: products.map(
          (product) {
            return ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text(product.name),
              subtitle: Text("${product.price} €"),
            );
          },
        ).toList(),
      ),
    );
  }
}

class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

List<Product> products = [
  Product("Äpfel", 2),
  Product("Mango", 3),
  Product("Bananen", 3),
  Product("Orange", 1),
  Product("Strawberry", 2),
];
