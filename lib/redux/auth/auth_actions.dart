import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:flutter/cupertino.dart';
import 'package:sports_team_management/data/models/user.dart';

class UserLoginSuccess {
  UserLoginSuccess({
    this.user,
  });
  final FirebaseAuth.User user;
}

class VerifyAuthenticationState {}

@immutable
class OnAuthenticated {
  final User user;
  const OnAuthenticated({@required this.user});

  @override
  String toString() {
    return "OnAuthenticated{user: $user}";
  }
}

class UserLogin {
  UserLogin({
    this.email,
    this.password,
    Completer completer,
  }) : completer = completer ?? Completer();
  final Completer completer;
  final String email;
  final String password;
}

class UserSignup {
  UserSignup({
    this.email,
    this.password,
    Completer completer,
  }) : completer = completer ?? Completer();
  final Completer completer;
  final String email;
  final String password;
}

class UserLogout {}

class OnLogoutSuccess {
  OnLogoutSuccess();

  @override
  String toString() {
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

class EditUser {
  final User user;
  final bool isCurrentUser;
  EditUser({this.user, this.isCurrentUser});
}

class LoadUsers {}

class LoadUsersResult {
  final List<User> users;
  LoadUsersResult({this.users});
}
