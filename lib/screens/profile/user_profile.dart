import 'package:avada_test/global_variables.dart';
import 'package:avada_test/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'User ${user.user.email}',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                setState(() {
                  isLogin = false;
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
