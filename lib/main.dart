import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_id/model/provider/state_provider.dart';
import 'package:test_flutter_id/view/home.dart';
import 'view/product_list.dart';

void main() {
  // runApp(MyApp());
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
