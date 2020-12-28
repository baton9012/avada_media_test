import 'package:flutter/material.dart';

class SplashNavigationAnimation extends MaterialPageRoute {
  Widget nextWidget;

  SplashNavigationAnimation({@required this.nextWidget})
      : super(builder: (context) => nextWidget);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: nextWidget,
    );
  }
}
