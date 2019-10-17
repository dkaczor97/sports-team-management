import 'package:flutter/material.dart';
import 'package:sports_team_management/enums/authentication/auth-status.dart';
import 'package:sports_team_management/login-signup/login-signup-page.dart';
import 'package:sports_team_management/pages/home/home-page.dart';
import 'package:sports_team_management/services/authentication/base/base-authentication.dart';

class RootPage extends StatefulWidget{
  RootPage({this.auth});

  final BaseAuthentication auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage>{
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

  @override
  void initState(){
    super.initState();
    widget.auth.getCurrentUser().then((user){
      setState(() {
       if(user != null){
         _userId = user?.uid;
       } 
       authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback(){
    widget.auth.getCurrentUser().then((user){
      setState(() {
       _userId = user.uid.toString(); 
      });
    });

    setState(() {
     authStatus = AuthStatus.LOGGED_IN; 
    });
  }

  void logoutCallback(){
    setState(() {
     authStatus = AuthStatus.NOT_LOGGED_IN; 
     _userId = "";
    });
  }

  Widget buildWaitingScreen(){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    switch(authStatus){
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignupPage(
          auth: widget.auth,
          loginCallback: loginCallback
        );
      case AuthStatus.LOGGED_IN:
        if(_userId != null && _userId.length > 0){
          return new HomePage(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback
          );
        }
        else{
          return buildWaitingScreen();
        }
        break;
      default:
        return buildWaitingScreen();
    }

  }
}