import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_team_management/pages/home/home-page.dart';
import 'package:sports_team_management/sign-in/sign_in_page.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final firebaseAuth = Provider.of<FirebaseAuth>(context);
    return StreamBuilder<FirebaseUser>(
      stream: firebaseAuth.onAuthStateChanged,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          FirebaseUser user = snapshot.data;
          if(user==null){
            return SignInPage();
          }
          return HomePage();
        }
        else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            )
          );
        }
      },
    );
  }
}