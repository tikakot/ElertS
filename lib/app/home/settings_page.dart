import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/ProfileScreen.dart';
import 'package:flutter_app/app/home/home_page.dart';
import 'package:flutter_app/app/sign_in/sign_in_page.dart';



class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 2.0,
      ),
      backgroundColor: Colors.grey[200],
      body: BodyLayout(),
    );
  }

  }


Future<void> _homePage(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}
Future<void> _profileScreen(BuildContext context) async {
 Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
}


class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Edit Profile'),
        trailing: Icon(Icons.chevron_right),
        selected: true,
        onTap:() => _profileScreen(context),
      ),
      ListTile(
        title: Text('Contact Lists'),
        trailing: Icon(Icons.chevron_right),
        selected: true,
        onTap:() => _homePage(context),

      ),
      ListTile(
        title: Text('Change message'),
      ),
    ],
  );
}



