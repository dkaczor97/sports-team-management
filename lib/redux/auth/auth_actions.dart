import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sports_team_management/data/models/user.dart';



class UserLoginSuccess{
  UserLoginSuccess({
    this.user,

  });
  final FirebaseUser user;
}

//------------- poprawione
class VerifyAuthenticationState{}

@immutable
class OnAuthenticated{
  final User user;
  const OnAuthenticated({@required this.user});

  @override
  String toString(){
    return "OnAuthenticated{user: $user}";
  }
}

class UserLogin{
  UserLogin({
    this.email,
    this.password,
    Completer completer,
  }) : completer = completer ?? Completer();
  final Completer completer;
  final String email;
  final String password;
}

class UserLogout{}

class OnLogoutSuccess{
  OnLogoutSuccess();

  @override
  String toString(){
    return "LogOut{user: null}";
  }
}

class OnLogoutFail {
  final dynamic error;

  OnLogoutFail(this.error);

  @override
  String toString() {
    return "OnLogoutFail{There was an error logging in: $error}";
  }
}
