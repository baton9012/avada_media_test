import 'package:avada_test/global_variables.dart';
import 'package:avada_test/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  final bool isSignIn;

  const Sign({this.isSignIn = true});

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  String _login;
  String _password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Center(
          heightFactor: 2,
          child: Text(
            widget.isSignIn ? 'Sign In' : 'Sign Up',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (login) {
                    if (login.isEmpty) {
                      return 'Enter email';
                    }
                  },
                  onSaved: (login) => _login = login,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(10.0)),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  validator: (password) {
                    if (password.isEmpty) {
                      return 'Enter password';
                    }
                  },
                  onSaved: (password) => _password = password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        gapPadding: 2.0,
                        borderRadius: BorderRadius.circular(10.0)),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24),
                RaisedButton(
                  color: Colors.green,
                  onPressed: _sign,
                  child: Text(
                    widget.isSignIn ? 'Sign In' : 'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _sign() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      if (widget.isSignIn) {
        await _signIn();
      } else {
        await _signUp();
      }
      isLogin = true;
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(
                title: user.user.email,
                initialIndex: 1,
              )));
    }
  }

  Future<void> _signIn() async {
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _login, password: _password);
    } catch (error) {
      print(error.message);
    }
  }

  void _signUp() async {
    user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _login, password: _password);
  }
}
