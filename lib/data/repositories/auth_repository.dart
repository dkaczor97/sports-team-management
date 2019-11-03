import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_team_management/models/user.dart';

class AuthRepository{
  FirebaseAuth auth;

  AuthRepository({this.auth});

  Future<FirebaseUser> login({
    String email,
    String password
  }) async{
    
    AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<void> logout()async{
    await auth.signOut();
  }
  
}