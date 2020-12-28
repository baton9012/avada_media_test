import 'package:avada_test/screens/splash/splash_delivery.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dresses',
      home: SplashDelivery(), //MyHomePage(title: 'Dresses'),
    );
  }
}
