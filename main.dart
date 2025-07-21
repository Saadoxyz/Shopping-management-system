import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ProductListScreen(),
    );
  }
}
class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  Product(this.name, this.imageUrl, this.price, this.description);
}
class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product('Pants', 'images/pant.jpeg', 29.99, 'blacks cotton pants, manageable , comfortable and chinos'),
    Product('shirts', 'images/shirts.jpeg', 19.99, 'Elevate your wardrobe with our stylish shirts, crafted from soft, breathable fabric that ensures you look and feel your best all day long.'),
    Product('watch', 'images/watch.jpeg', 49.99, 'Stay punctual and make a statement with our elegant watch, featuring a timeless design that perfectly blends functionality and style.'),
    Product('glasses', 'images/glasses.jpeg', 39.99, 'Step into comfort and confidence with our versatile shoes, designed for every occasion, from casual outings to formal events.'),
    Product('shoes', 'images/shoes.jpeg', 59.99, 'Enhance your vision and your style with our chic glasses, combining modern design with superior lens technology for a perfect fit.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl, width: 50, height: 50),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class ProductDetailScreen extends StatelessWidget {
  final Product product;
  ProductDetailScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 200),
            SizedBox(height: 16.0),
            Text(product.name, style: TextStyle(fontSize: 24)),
            Text('\$${product.price}', style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 16.0),
            Text(product.description),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Product List'),
            ),
          ],
        ),
      ),
    );
  }
}
