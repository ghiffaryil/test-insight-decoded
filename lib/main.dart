import 'package:flutter/material.dart';
import 'package:test_flutter_id/view/home.dart';
import 'view/product_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Demo',
      // home: ProductList(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      },
    );
  }
}
