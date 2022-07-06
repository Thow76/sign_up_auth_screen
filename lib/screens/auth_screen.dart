import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //Implementing FIrebase Auth
  final _auth = FirebaseAuth.instance;

  //Function that adds info to Firebase
  void _submitAuthForm(
      String email, String password, String userName, bool isLogin)

  //Implementing Firebase auth email sign in
  async {
    UserCredential authResult;

    if (isLogin) {
      authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } else {
      authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(
        _submitAuthForm,
      ),
    );
  }
}
