import 'package:avada_test/screens/catalog/components/catalog_card.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(94, 206, 123, 1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.touch_app_outlined,
                    color: Color.fromRGBO(190, 191, 196, 1),
                    size: 38,
                  ),
                  Text(
                    "Tab & hold product to add to cart",
                    style: TextStyle(
                      color: Color.fromRGBO(190, 191, 196, 1),
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                      child: Row(
                        children: [
                          Text(
                            "SORT BY",
                            style: TextStyle(
                              color: Color.fromRGBO(29, 31, 34, 1),
                            ),
                          ),
                          Icon(
                            Icons.compare_arrows,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ],
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Divider(
                height: 3,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            CatalogCard(),
          ],
        ),
      ),
    );
  }
}
