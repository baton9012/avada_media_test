import 'package:avada_test/dialog/sign.dart';
import 'package:avada_test/global_variables.dart';
import 'package:avada_test/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 113,
            ),
            Image.asset('assets/img/fogg-uploading-1.png'),
            SizedBox(height: 37),
            _signInUpOut(),
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
                Spacer(flex: 5),
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
                  color: Colors.black,
                ),
                Spacer(flex: 2),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            title: isLogin ? user.user.email : "Dress",
                            initialIndex: 1,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Skip >',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.green,
                        fontWeight: FontWeight.normal,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 44)
          ],
        ),
      ),
    );
  }

  Widget _signInUpOut() {
    if (isLogin) {
      return FlatButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Sign out'),
              content: Text('Sign out from ${user.user.email}'),
              actions: [
                FlatButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pop();
                    setState(() {
                      isLogin = false;
                    });
                  },
                  child: Text('OK'),
                ),
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'))
              ],
            ),
          );
        },
        child: Text(
          'Sign out',
          style: TextStyle(
            fontSize: 28,
            decoration: TextDecoration.none,
            color: Colors.green,
            fontWeight: FontWeight.normal,
            letterSpacing: -2,
          ),
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              showDialog(context: context, child: Sign());
            },
            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 28,
                decoration: TextDecoration.none,
                color: Colors.green,
                fontWeight: FontWeight.normal,
                letterSpacing: -2,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 22,
            color: Colors.grey,
          ),
          FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  child: Sign(
                    isSignIn: false,
                  ));
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                fontSize: 28,
                decoration: TextDecoration.none,
                color: Colors.green,
                fontWeight: FontWeight.normal,
                letterSpacing: -2,
              ),
            ),
          ),
        ],
      );
    }
  }
}
