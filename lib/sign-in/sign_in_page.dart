import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget{
  Future<void> _signInAnonymously() async{
    try{

      //await _firebaseAuth.signInWithEmailAndPassword({"dawidkaczor97@gmail.com","abcdef"});
    } catch(e){
      print(e);
    }
  }
  FirebaseAuth _firebaseAuth;

  @override
  Widget build(BuildContext context){
    _firebaseAuth = Provider.of<FirebaseAuth>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Sign in'),),
      body: Center(
        child: RaisedButton(
          child: Text("Sign in anonymously"),
          onPressed: _signInAnonymously,
        ),
      )
      );
  }
}