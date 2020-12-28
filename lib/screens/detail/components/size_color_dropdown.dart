import 'package:flutter/material.dart';

class SizeColorDropDown extends StatefulWidget {
  final bool isSize;

  SizeColorDropDown({
    this.isSize = true,
  });

  @override
  _SizeColorDropDownState createState() => _SizeColorDropDownState();
}

class _SizeColorDropDownState extends State<SizeColorDropDown> {
  int selectedItem = 0;
  List<String> _items;

  @override
  Widget build(BuildContext context) {
    _items = widget.isSize
        ? ['small', 'medium', 'large']
        : ["Grey", "Red", "Black", "Green"];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(241, 242, 243, 1),
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Size',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          DropdownButton(
            value: _items[selectedItem],
            elevation: 1,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            underline: SizedBox(),
            items: _items
                .map((item) => DropdownMenuItem(
                      child: _createDropdownMenuItem(item),
                      value: item,
                    ))
                .toList(),
            onChanged: (value) {
              print(value);
              setState(() {
                selectedItem = _items.indexOf(value);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _createDropdownMenuItem(String title) {
    print(title);
    return widget.isSize
        ? Text(title,
            style: TextStyle(
              color: Color.fromRGBO(29, 31, 34, 1),
            ))
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20.0,
                width: 20.0,
                color: _setDressColor(title),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: Color.fromRGBO(29, 31, 34, 1)),
              ),
            ],
          );
  }

  Color _setDressColor(String colorTitle) {
    switch (colorTitle) {
      case "Grey":
        return Colors.grey;
      case "Red":
        return Colors.red;
      case "Black":
        return Colors.black;
      case "Green":
        return Colors.green;
      default:
        return Colors.white;
    }
  }
}
