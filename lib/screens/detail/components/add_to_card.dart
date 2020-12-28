import 'package:avada_test/models/dress.dart';
import 'package:flutter/material.dart';

import '../../../global_variables.dart';

class AddToCard extends StatefulWidget {
  final int id;

  const AddToCard({Key key, this.id}) : super(key: key);
  @override
  _AddToCardState createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  List<String> _countItemsList = ['1', '2', '3'];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: FlatButton(
            padding: EdgeInsets.symmetric(
              vertical: 22.0,
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added to card'),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: 'OK',
                    onPressed: () {
                      dressInCard.add(
                        Dress(
                          count: _countItemsList
                                  .indexOf(_countItemsList[selectedItem]) +
                              1,
                          pathImg: 'assets/img/image.png',
                          title: 'Scaridian dress',
                          price: 300,
                          size: 1,
                          color: 1,
                        ),
                      );
                      Scaffold.of(context).hideCurrentSnackBar();
                    },
                  ),
                ),
              );
            },
            color: Colors.green,
            child: Text(
              'ADD TO CARD',
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
          ),
        ),
        SizedBox(width: 15.0),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(241, 242, 243, 1),
                width: 2.0,
              ),
            ),
            child: DropdownButton(
              value: _countItemsList[selectedItem],
              elevation: 1,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              underline: SizedBox(),
              items: _countItemsList
                  .map((count) => DropdownMenuItem(
                      value: count,
                      child: Text(
                        count,
                        style: TextStyle(color: Color.fromRGBO(29, 31, 34, 1)),
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = _countItemsList.indexOf(value);
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
