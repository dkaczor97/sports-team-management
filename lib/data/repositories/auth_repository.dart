import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuthUser;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sports_team_management/data/firestore_path.dart';
import 'package:sports_team_management/data/models/user.dart';
import 'package:sports_team_management/enums/role/roles.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static const EMAIL = "email";
  static const UID = "uid";
  static const NAME = "name";
  static const JERSEYNUMBER = "jerseyNumber";
  static const ROLE = "role";
  static const TOKEN = "token";
  final FirebaseAuthUser.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseMessaging _messaging;

  AuthRepository(this._auth, this._firestore, this._messaging) {
    _messaging.requestPermission();

    // _messaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //     return;
    //           },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //     return;
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //     return;
    //   },
    // );
  }

  Future<User> login(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return await _fromFirebaseUser(result.user);
  }

  Future<User> signUp(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return await _fromFirebaseUser(result.user);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Stream<User> getAuthenticationStateChange() {
    return _auth.authStateChanges().asyncMap((firebaseUser) {
      return _fromFirebaseUser(firebaseUser);
    });
  }

  Future<User> _fromFirebaseUser(FirebaseAuthUser.User firebaseUser) async {
    if (firebaseUser == null) {
      return Future.value(null);
    }
    final documentReference =
        _firestore.doc(FirestorePaths.userPath(firebaseUser.uid));
    final snapshot = await documentReference.get();
    final token = await _messaging.getToken();
    User user;
    if (snapshot.data == null) {
      user = User((u) => u
        ..uid = firebaseUser.uid
        ..email = firebaseUser.email
        ..name = firebaseUser.email
        ..role = Roles.admin
        ..jerseyNumber = 0
        ..token = token);
      await documentReference.set(toMap(user));
    } else {
      user = fromDoc(snapshot);
      user = user.rebuild((u) => u..token = token);
      await documentReference.set(toMap(user));
    }
    return user;
  }

  Future<void> editUser(User user) async {
    await _firestore.doc(FirestorePaths.userPath(user.uid)).update(toMap(user));
  }

  Future<List<User>> loadUsers() async {
    final snapshot =
        await _firestore.collection(FirestorePaths.PATH_USERS).get();
    return snapshot.docs.map((u) => fromDoc(u)).toList();
  }

  static toMap(User user) {
    return {
      UID: user.uid,
      NAME: user.name,
      EMAIL: user.email,
      JERSEYNUMBER: user.jerseyNumber,
      ROLE: user.role,
      TOKEN: user.token
    };
  }

  static User fromDoc(DocumentSnapshot document) {
    return User((u) => u
      ..uid = document.id
      ..name = document[NAME]
      ..email = document[EMAIL]
      ..jerseyNumber = document[JERSEYNUMBER]
      ..role = document[ROLE]
      ..token = document[TOKEN]);
  }
}
