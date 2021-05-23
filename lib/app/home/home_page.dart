
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/home/contact_list_file.dart';
import 'package:flutter_app/app/home/edit_contact_page.dart';
import 'package:flutter_app/app/home/models/contacts.dart';
import 'package:flutter_app/common_widget/show_alert_dialog.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/app/home/settings_page.dart';

class HomePage extends StatelessWidget {


  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen:false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _settings(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
  }


  Future<void> _confirmSignOut(BuildContext context) async{
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to log out?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if(didRequestSignOut == true){
      _signOut(context);
    }
}



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(icon: Icon(Icons.menu),
              onPressed: () => _settings(context),
          ),
          FlatButton(
            child:
            Text('Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),

            onPressed:() => _confirmSignOut(context),

          ),
        ],
      ),
      body: contactView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditContactPage.show(context),
      ),
    );
  }


 //Widget _buildContents(BuildContext context) {
 //   final database = Provider.of<Database>(context, listen:false);
  //  return StreamBuilder<List<Contacts>>(
  //    stream: database.contactsStream(),
   //   builder: (context, snapshot){
    //    if (snapshot.hasData){
    //      final contacts = snapshot.data;
    //      final children = contacts
    //          .map((contacts) => ContactListTile(
    //        contacts: contacts,
    //        onTap: () => EditContactPage.show(context, contacts: contacts),
   //       ))
    //          .toList();
   //     return ListView(children: children);
   //     }
   //     if (snapshot.hasError){
  //        return Center(child: Text('Some error occured'));
   //     }
  //      return Center(child: CircularProgressIndicator());
   //   },
  //  );
 //}
}

class contactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen:false);
    return StreamBuilder<List<Contacts>>(
      stream: database.contactsStream(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          final contacts = snapshot.data;
          final children = contacts
              .map((contacts) => ContactListTile(
            contacts: contacts,
            onTap: () => EditContactPage.show(context, contacts: contacts),
          ))
              .toList();
          return ListView(children: children);
        }
        if (snapshot.hasError){
          return Center(child: Text('Some error occured'));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
