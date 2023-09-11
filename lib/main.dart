import 'package:flutter/material.dart';
import 'package:products/screens/pages/products_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      
      home: ProductsPage(),
    );
  }
}
