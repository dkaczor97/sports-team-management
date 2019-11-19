import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sports_team_management/data/firestore_path.dart';
import 'package:sports_team_management/data/models/user.dart';

class AuthRepository{
  static const EMAIL = "email";
  static const UID = "uid";
  static const NAME = "name";
  static const JERSEYNUMBER = "jerseyNumber";

  final FirebaseAuth _auth;
  final Firestore _firestore;

  AuthRepository(this._auth, this._firestore);

  Future<User> login(
    String email,
    String password
  ) async{
    
    final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return await _fromFirebaseUser(result.user);
  }

  Future<void> logout()async{
    await _auth.signOut();
  }

  Stream<User> getAuthenticationStateChange(){
    return _auth.onAuthStateChanged.asyncMap((firebaseUser){
      return _fromFirebaseUser(firebaseUser);
    });
  }
  
  Future<User> _fromFirebaseUser(FirebaseUser firebaseUser) async{
    if(firebaseUser == null){
      return Future.value(null);
    }
    final documentReference = _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
    final snapshot = await documentReference.get();

    User user;
    if(snapshot.data == null){
      user = User((u) => u
        ..uid = firebaseUser.uid
        ..email = firebaseUser.email
        ..name = firebaseUser.email
      );
      await documentReference.setData(toMap(user));
    } else{
      user = fromDoc(snapshot);
    }
    return user;
  }

  static toMap(User user) {
    return {
      UID: user.uid,
      NAME: user.name,
      EMAIL: user.email,
    };
  }

    static User fromDoc(DocumentSnapshot document) {
    return User((u) => u
      ..uid = document.documentID
      ..name = document[NAME]
      ..email = document[EMAIL]
      ..jerseyNumber = document[JERSEYNUMBER]
    );
  }


}