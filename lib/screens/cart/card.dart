import 'package:avada_test/global_variables.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        leading: Image.asset(dressInCard[index].pathImg),
        title: Text(dressInCard[index].title),
      );
    });
  }
}
