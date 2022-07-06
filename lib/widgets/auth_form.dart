import 'dart:collection';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //Capturing form info to be passed to TextField onpressed function
  final _formKey = GlobalKey<FormState>();

  //Controls whether login or sign up page is shown
  var _isLogin = true;
  var _userEmail = '';
  var _userPassword = '';
  var _userName = '';
  late BuildContext context;

  //Method for implementing all the validators of the textform fields
  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();

    //Closes keyboard after input form submitted
    FocusScope.of(context).unfocus();

    //Checking if form is valid and saving input via the onsaved function
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16),
              // Input Form
              child: Form(
                //Connecting _formKey variable to form
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    //Validating input

                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(labelText: 'Email address'),
                        //Function saving the input
                        onSaved: (value) {
                          _userEmail = value!;
                        }),
                    //Controls whether the username field is displayed according to login/sign up
                    if (!_isLogin)
                      TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please enter at least 4 characters.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Username'),
                          onSaved: (value) {
                            _userName = value!;
                          }),

                    TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Password'),
                        // Hide password
                        obscureText: true,
                        onSaved: (value) {
                          _userPassword = value!;
                        }),

                    SizedBox(
                      height: 12,
                    ),
                    RaisedButton(
                      //Setting up the login/sign up buttons to offer different states
                      child: Text(_isLogin ? 'Login' : 'Sign Up'),
                      onPressed: _trySubmit,
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      //Setting up the create account/already have account states
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'),
                      onPressed: () {
                        //Initialising the state change for the sign in options
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
