import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/sign_in/email_sign_in_page.dart';
import 'package:flutter_app/app/sign_in/sign_in_button.dart';
import 'package:flutter_app/app/sign_in/social_sign_in_button.dart';
import 'package:flutter_app/common_widget/Custom_raised_button.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {


  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen:false);
      await auth.signInAnonymously();

    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen:false);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context){
   Navigator.of(context).push(
     MaterialPageRoute<void>(
       fullscreenDialog: true,
       builder: (context) => EmailSignInPage(),
     ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElertS'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height:48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(height:8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height:8.0),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[700],
            onPressed: () => _signInWithEmail(context),
          ),
          SizedBox(height:8.0),
          SignInButton(
            text: 'Go Anonymously',
            textColor: Colors.white,
            color: Colors.lime[700],
            onPressed: () => _signInAnonymously(context),
          ),
        ],
      ),
    );
  }
}

void _signInWithGoogle() {
  //TODO: Auth with Google
}
