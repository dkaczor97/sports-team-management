import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class UserLogin{
  UserLogin({
    this.completer,
    this.email,
    this.password
  });
  final Completer completer;
  final String email;
  final String password;
}

class UserLoginSuccess{
  UserLoginSuccess({
    this.user,

  });
  final FirebaseUser user;
}

class UserLogout{}