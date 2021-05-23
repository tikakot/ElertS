import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_form.dart';
import 'package:flutter_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
            child: EmailSignInForm(),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

}