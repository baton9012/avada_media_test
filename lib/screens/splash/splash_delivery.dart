import 'package:avada_test/screens/splash/splash_completed.dart';
import 'package:avada_test/utils/splash_navigation_animation.dart';
import 'package:flutter/material.dart';

class SplashDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _navigateToSplashCompleted(context),
      builder: (context, snapshot) => SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 164,
              ),
              Image.asset('assets/img/fogg-delivery-1.png'),
              SizedBox(height: 86),
              Text(
                'Welcome to Fluxstore',
                style: TextStyle(
                  fontSize: 31,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  letterSpacing: -2,
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
                    color: Colors.grey,
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

  Future _navigateToSplashCompleted(BuildContext context) async {
    await Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.pushReplacement(
          context, SplashNavigationAnimation(nextWidget: SplashCompleted()));
    });
  }
}
