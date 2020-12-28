import 'dart:async';

import 'package:flutter/material.dart';

class DiscountTimer extends StatefulWidget {
  @override
  _DiscountTimerState createState() => _DiscountTimerState();
}

class _DiscountTimerState extends State<DiscountTimer> {
  final int minute = DateTime.now().minute + 10;
  final int hour = DateTime.now().hour;
  final int day = DateTime.now().day;
  String timeLeft = '';
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _discountCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        'Remain $timeLeft',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  void _discountCounter() {
    const Duration duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (DateTime.now().hour < DateTime.now().hour + 1) {
        setState(() {
          String dayLeft = (day - DateTime.now().day).toString();
          String hourLeft = (hour - DateTime.now().hour).toString();
          String minuteLeft = (minute - DateTime.now().minute).toString();
          timeLeft = '$dayLeft days ${hourLeft}h:${minuteLeft}m';
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
