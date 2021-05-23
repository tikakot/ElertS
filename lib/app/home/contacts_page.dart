import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  //final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      //onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          leading: Icon(Icons.menu),
          actions: [
            IconButton(icon: Icon(Icons.menu), onPressed: (){}
            ),

          ],
        ));
  }
}
