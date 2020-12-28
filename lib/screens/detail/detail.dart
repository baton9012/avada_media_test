import 'package:avada_test/screens/detail/components/add_to_card.dart';
import 'package:avada_test/screens/detail/components/description.dart';
import 'package:avada_test/screens/detail/components/rating.dart';
import 'package:avada_test/screens/detail/components/size_color_dropdown.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final int id;
  final String path;

  const Detail({@required this.id, @required this.path});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.id,
                child: Image.asset(widget.path),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Cashmere Textured Dress',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$95.00',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      '\$50.00',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Rating(),
                SizedBox(height: 20.0),
                SizeColorDropDown(),
                SizedBox(height: 20.0),
                SizeColorDropDown(
                  isSize: false,
                ),
                SizedBox(height: 20.0),
                AddToCard(
                  id: widget.id,
                ),
                SizedBox(height: 20.0),
                Description(),
                SizedBox(height: 30.0),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
