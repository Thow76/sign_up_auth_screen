import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email address'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      // Hide password
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    RaisedButton(
                      child: Text('Login'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Create Account'),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
