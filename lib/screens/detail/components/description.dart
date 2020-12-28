import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  IconData showDescriptionIcon = Icons.keyboard_arrow_up;
  bool isShowDescription = false;
  Widget textDescription;
  Widget productCode;
  Widget category;
  Widget material;
  Widget country;

  @override
  Widget build(BuildContext context) {
    _shoDescription();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Description'),
            IconButton(
                icon: Icon(showDescriptionIcon),
                onPressed: () {
                  setState(() {
                    if (isShowDescription) {
                      showDescriptionIcon = Icons.keyboard_arrow_up;
                      isShowDescription = false;
                    } else {
                      showDescriptionIcon = Icons.keyboard_arrow_down;
                      isShowDescription = true;
                    }
                  });
                }),
          ],
        ),
        textDescription,
        SizedBox(height: isShowDescription ? 26 : 0),
        productCode,
        category,
        material,
      ],
    );
  }

  Padding _createDressDetailDecriprion(
    String label,
    String value, {
    TextStyle textStyle = const TextStyle(fontWeight: FontWeight.bold),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: RichText(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: textStyle,
            )
          ],
        ),
      ),
    );
  }

  void _shoDescription() {
    if (isShowDescription) {
      textDescription = Text(
        'The Karissa V-Neck Tee features a semi-fitted shape that\'s flattering for every figure. You can hit the gym with confidence while it hugs curves and hides common \"problem\" areas. Find stunning women\'s cocktail dresses and party dresses.',
      );
      productCode = _createDressDetailDecriprion(
        'Product Code:  ',
        '578902-00',
      );
      category = _createDressDetailDecriprion(
        'Category:  ',
        'Sweaters',
        textStyle: TextStyle(
          color: Colors.greenAccent,
          decoration: TextDecoration.underline,
        ),
      );
      material = _createDressDetailDecriprion('Material:  ', 'Cotton');
      country = _createDressDetailDecriprion('Country:  ', 'Germany');
    } else {
      textDescription = SizedBox();
      productCode = SizedBox();
      category = SizedBox();
      material = SizedBox();
      country = SizedBox();
    }
  }
}
