import 'package:firebase_auth/firebase_auth.dart';

class AuthState{
  AuthState({this.currentUser});
  final FirebaseUser currentUser;


  AuthState copyWith({FirebaseUser currrentUser}){
    return new AuthState(
      currentUser: currrentUser ?? this.currentUser
    );
  }
}