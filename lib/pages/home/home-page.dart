import 'package:flutter/material.dart';
import 'package:sports_team_management/services/authentication/base/base-authentication.dart';

class HomePage extends StatelessWidget{
  HomePage({this.auth,this.logoutCallback,this.userId});

  final BaseAuthentication auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: new AppBar(
        title: new Text("Login demo"),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Logout'),
            onPressed: signOut,
          )
        ],
      ),
      body: new Container(
        child: new Text("Siema"),
      )
    );
  }

  void signOut() async{
    try{
      await auth.signOut();
      logoutCallback();
    }
    catch(e){
      print(e);
    }
  }
}