import 'package:avada_test/screens/login/login.dart';
import 'package:avada_test/utils/splash_navigation_animation.dart';
import 'package:flutter/material.dart';

class SplashCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _navigateToLogin(context),
      builder: (context, snapshot) => SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 132,
              ),
              Image.asset('assets/img/fogg-order-completed.png'),
              SizedBox(height: 66),
              Text(
                'Lorconsectetur adipisicing',
                style: TextStyle(
                  fontSize: 28,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -3,
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Lorem Ipsum Dolor Sit Amet',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'Consectetur Adipisicing Elit',
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 3,
                    width: 28,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 3,
                    width: 28,
                    color: Colors.black,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 3,
                    width: 28,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 46,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _navigateToLogin(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.pushReplacement(
          context, SplashNavigationAnimation(nextWidget: Login()));
    });
  }
}
