import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int mark;
  final int countVote;

  const Rating({this.mark = 0, this.countVote = 0});

  @override
  _RatingState createState() => _RatingState(mark, countVote);
}

class _RatingState extends State<Rating> {
  int countVote;
  int mark;

  _RatingState(this.mark, this.countVote);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _createStars(0),
        _createStars(1),
        _createStars(2),
        _createStars(3),
        _createStars(4),
        SizedBox(width: 8.0),
        Text(
          '(${countVote})',
          style: TextStyle(fontSize: 15.0),
        )
      ],
    );
  }

  Icon _createStars(int i) {
    return i < mark
        ? Icon(
            Icons.star,
            color: Color.fromRGBO(94, 206, 123, 1),
          )
        : Icon(Icons.star);
  }
}
